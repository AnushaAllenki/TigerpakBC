namespace TigerpakBC.TigerpakBC;

using Microsoft.Sales.Document;

pageextension 70148 "Sales Return Order Ext" extends "Sales Return Order"
{
    layout
    {
        addafter("Your Reference")
        {
            field("Auto - Email Post"; Rec."Auto Email - Post")
            {
                ApplicationArea = All;
                Caption = 'Auto - Email Post';
                ToolTip = 'Specifies if the document should be automatically emailed after posting.';
            }

        }
    }
}


