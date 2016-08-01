package org.shell.mmo.sample.login.handler;

import com.google.common.base.Preconditions;
import com.shell.mmo.utils.net.NetUtil;
import org.shell.mmo.sample.message.proto.Global.Module;
import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.role.Role;

public class ResLoginLoginHandler extends org.shell.mmo.sample.message.MessageHandler<LogicClient.ResLoginLogin> {
    @Override
    protected void execute(LogicClient.ResLoginLogin message) {
        Preconditions.checkArgument(!message.hasError());
        if (message.hasLeaderRole()) {
            account.setRole(new Role(message.getLeaderRole()));
        } else {
            NetUtil.write(channel, LogicClient.ReqRoleCreateRole.newBuilder().setName(account.getUsr()));
        }
        account.setGold(message.getGold());
        account.setId(message.getId());
    }

    @Override
    public Module module() {
        return Module.LOGIN;
    }

}
