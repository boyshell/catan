package org.shell.mmo.sample.role.handler;

import com.google.common.base.Preconditions;
import org.shell.mmo.sample.message.proto.Global.Module;
import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.role.Role;
import org.shell.mmo.sample.role.RoleMessageHandler;

public class ResRoleCreateRoleHandler extends RoleMessageHandler<LogicClient.ResRoleCreateRole> {
    @Override
    protected void execute(LogicClient.ResRoleCreateRole message) {
        Preconditions.checkArgument(!message.hasError());
        account.setRole(new Role(message.getLeaderRole()));
    }

    @Override
    public Module module() {
        return Module.ROLE;
    }

}
