package org.shell.mmo.sample.guice;

import com.google.inject.AbstractModule;
import com.google.inject.TypeLiteral;
import com.google.inject.matcher.Matchers;
import com.google.inject.spi.InjectionListener;
import com.google.inject.spi.TypeEncounter;
import com.google.inject.spi.TypeListener;
import com.shell.mmo.modules.account.AccountService;
import com.shell.mmo.modules.role.RoleService;
import com.shell.mmo.modules.uid.UIDService;
import com.shell.mmo.utils.ExcelUtil;
import org.apache.commons.lang3.tuple.Pair;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Sheet;
import org.shell.mmo.sample.config.ConfigGroup;
import org.shell.mmo.sample.config.proto.Config;
import org.shell.mmo.sample.uid.UID;
import org.shell.mmo.sample.uid.UIDSaver;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.annotation.PostConstruct;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.*;

/**
 * Created by zhangxiangxi on 16/7/26.
 */
public class PostConstructModule extends AbstractModule {
    private static Logger logger = LoggerFactory.getLogger(PostConstructModule.class);
    private final List<Runnable> shutdownTasks;
    private final File configDir;

    public PostConstructModule(List<Runnable> shutdownTasks, File configDir) {
        this.shutdownTasks = shutdownTasks;
        this.configDir = configDir;
    }

    @Override
    protected void configure() {
        bindListener(Matchers.any(), new TypeListener() {
            public <I> void hear(TypeLiteral<I> type, TypeEncounter<I> encounter) {
                encounter.register((InjectionListener<I>) injector -> {
                    Optional<Method> first = Arrays.stream(injector.getClass().getDeclaredMethods()).filter(m -> m.isAnnotationPresent(PostConstruct.class)).findFirst();
                    first.ifPresent(method -> {
                        try {
                            method.setAccessible(true);
                            method.invoke(injector);
                        } catch (IllegalAccessException | InvocationTargetException e) {
                            logger.error(method.getDeclaringClass().getSimpleName() + "初始化失败", e);
                            System.exit(1);
                        }
                    });
                });
            }
        });

        org.shell.mmo.sample.account.AccountService accountService = createAccountService();
        bind(AccountService.class).toInstance(accountService);
        bind(org.shell.mmo.sample.account.AccountService.class).toInstance(accountService);
        bind(RoleService.class).toInstance(createRoleService());
        bind(UIDService.class).toInstance(createUIDService());
        bind(ConfigGroup.class).toInstance(createConfigGroup());
    }

    private org.shell.mmo.sample.account.AccountService createAccountService() {
        try {
            return new org.shell.mmo.sample.account.AccountService(shutdownTasks);
        } catch (Exception e) {
            logger.error("初始化AccountService出错", e);
            System.exit(-1);
        }
        return null;
    }

    private RoleService createRoleService() {
        // TODO 这里需要从数据库获取
        return new RoleService(new ArrayList<>());
    }

    private ConfigGroup createConfigGroup() {
        try {
            Pair<Map<String, Sheet>, Map<String, Sheet>> pair = ExcelUtil.parse(configDir);
            Config.ContainerGroup containerGroup = ConfigGroup.create(pair.getLeft(), pair.getRight());
            // TODO 测试阶段生效
            bind(Config.ContainerGroup.class).toInstance(containerGroup);
            return new ConfigGroup(containerGroup);
        } catch (IOException e) {
            logger.error("解析配置出错", e);
            System.exit(-1);
        } catch (InvalidFormatException e) {
            logger.error("解析配置出错", e);
            System.exit(-1);
        }
        return null;
    }

    UIDService createUIDService() {
        UIDService.Type[] uidTypes = new UIDService.Type[UID.values().length];
        for (int i = 0; i < uidTypes.length; ++i) {
            uidTypes[i] = UID.values()[i].getType();
        }
        return new UIDService(new UIDSaver(), shutdownTasks, uidTypes);
    }
}