package org.shell.mmo.sample.role.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ResRoleCreateRoleHandler extends org.shell.mmo.sample.message.AccountMessageHandler<LogicClient.ResRoleCreateRole> {
    @Override
    protected void execute(LogicClient.ResRoleCreateRole message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.ROLE;
    }
}
