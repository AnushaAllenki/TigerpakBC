namespace TigerpakBC.TigerpakBC;

using Microsoft.Sales.Receivables;

page 70101 TPCustomerledgerentryTS
{
    ApplicationArea = All;
    Caption = 'TPCustomerledgerentryTS';
    PageType = Card;
    SourceTable = "Cust. Ledger Entry";
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                
            }
        }
    }
}
