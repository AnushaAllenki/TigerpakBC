namespace TigerpakBC.TigerpakBC;

using Microsoft.Purchases.Payables;

pageextension 70153 "Apply Vendor Entries Ext" extends "Apply Vendor Entries"
{
    layout
    {
        addafter("posting date")
        {
            field("Document Date"; Rec."Document Date")
            {
                ApplicationArea = All;
                Caption = 'Document Date';
                ToolTip = 'Specifies the date of the document.';
            }

        }
    }
}
