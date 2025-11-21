namespace TigerpakBC.TigerpakBC;

using Microsoft.Purchases.Payables;

pageextension 70151 "Apply Vendor Entries Ext" extends "Apply Vendor Entries"
{
    layout
    {
        addafter("Posting Date")
        {
            field("Document Date"; Rec."Document Date")  //Adding Document Date to Apply Entried in vendor ledger entries
            {
                ApplicationArea = All;
                Caption = 'Document Date';
                Editable = false;
            }
        }
    }

}
