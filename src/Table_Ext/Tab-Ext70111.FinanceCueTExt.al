namespace ALProject.ALProject;

using Microsoft.Finance.RoleCenters;
using Microsoft.Sales.Receivables;

tableextension 70111 "Finance Cue TExt" extends "Finance Cue"
{
    fields
    {
        field(70100; "Overdue Sales Invoice Amount"; Decimal)
        {
            Caption = 'Overdue Sales Invoice Amount';
            AutoFormatExpression = eventsub.GetAmountFormat();
            AutoFormatType = 11;
            DecimalPlaces = 0 : 0;

        }
        field(70101; "Overdue Purch. Invoice Amount"; Decimal)
        {
            AutoFormatExpression = eventsub.GetAmountFormat();
            AutoFormatType = 11;
            Caption = 'Overdue Purch. Invoice Amount';
            DecimalPlaces = 0 : 0;
        }
    }
    var
        eventsub: Codeunit "EventSubscribers1";
}