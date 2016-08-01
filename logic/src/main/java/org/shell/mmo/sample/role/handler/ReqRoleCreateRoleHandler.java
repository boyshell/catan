package org.shell.mmo.sample.role.handler;

import com.google.inject.Inject;
import com.shell.mmo.modules.role.RoleService;
import com.shell.mmo.utils.StringUtil;
import com.shell.mmo.utils.net.NetUtil;
import org.shell.mmo.sample.account.RoleLoginEvent;
import org.shell.mmo.sample.event.EventBus;
import org.shell.mmo.sample.message.proto.Global;
import org.shell.mmo.sample.message.proto.Global.Module;
import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.role.Role;
import org.shell.mmo.sample.role.RoleMessageHandler;

public class ReqRoleCreateRoleHandler extends RoleMessageHandler<LogicClient.ReqRoleCreateRole> {
    @Inject
    RoleService roleService;
    @Inject
    EventBus eventBus;

    @Override
    protected void execute(LogicClient.ReqRoleCreateRole message) {
        if (account.getRole() != null) {
            NetUtil.write(channel, error(Global.Error.ROLE_EXIST));
            return;
        }
        // 长度非法
        if (!message.hasName() || message.getName().isEmpty() || message.getName().length() > 32) {
            NetUtil.write(channel, error(Global.Error.ROLE_NAME_LEN));
            return;
        }
        // 非法字符
        if (!StringUtil.legal(message.getName())) {
            NetUtil.write(channel, error(Global.Error.ROLE_NAME_ILLEGAL));
            return;
        }
        // 重复
        if (roleService.repeated(account.getKey().getPlatform(), account.getKey().getServer(), message.getName())) {
            NetUtil.write(channel, error(Global.Error.ROLE_NAME_REPEAT));
            return;
        }

        Role role = new Role();
        account.setRole(role);

        role.setName(message.getName());
        role.setLevel(1);
        role.getScene().setId(0); // TODO

        NetUtil.write(channel, LogicClient.ResRoleCreateRole.newBuilder().setLeaderRole(role.build()));

        eventBus.post(new RoleLoginEvent(account));
    }

    @Override
    public Module module() {
        return Module.ROLE;
    }

    @Override
    public com.google.protobuf.MessageLiteOrBuilder error(org.shell.mmo.sample.message.proto.Global.Error e) {
        return org.shell.mmo.sample.message.proto.LogicClient.ResRoleCreateRole.newBuilder().setError(e).build();
    }
}
