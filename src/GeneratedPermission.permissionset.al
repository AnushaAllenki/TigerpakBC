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
        tabledata "Market Industry Category" = RIMD,
        tabledata "Marketing Industry SubCategory" = RIMD,
        table "Market Industry Category" = X,
        table "Marketing Industry SubCategory" = X,
        page "Market Industry_Category" = X,
        page "Marketing Industry_SubCat" = X,
        page "TP Purchase Line" = X,
        page "TP Sales Invoiced API TS" = X,
        page "TP Salesorder Timestamps" = X,
        page TPcustLedgerEntriesTimestamps = X;
}