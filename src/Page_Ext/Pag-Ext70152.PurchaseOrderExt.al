namespace TigerpakBC.TigerpakBC;

using Microsoft.Purchases.Document;

pageextension 70152 "Purchase Order Ext" extends "Purchase Order"
{
    layout
    {
        addafter("Due Date")
        {
            field("Delivery Date"; Rec."Delivery Date")
            {
                ApplicationArea = All;
            }
        }
    }
}


