namespace Tigerpak;

using ALProject.ALProject;
using TigerpakBC.TigerpakBC;

permissionset 70101 GeneratedPermtp
{
    Assignable = true;
    Permissions = codeunit "EventSubscribers1" = X,
        codeunit EventSubscriptionSQ = X,
        tabledata "User Configuration" = RIMD,
        table "User Configuration" = X,
        page "User Configuration " = X,
        report "TP Custom Sales Cr. Memo" = X,
        page "Master Sales Quote Lines" = X,
        page "TP Sales Invoiced API TS" = X,
        page "TP Sales Lines" = X,
        page "TP Salesorder Timestamps" = X,
        page TPCustomerledgerentryTS = X;
}