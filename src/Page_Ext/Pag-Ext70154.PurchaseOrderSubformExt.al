namespace TigerpakBC.TigerpakBC;

using Microsoft.Purchases.Document;

pageextension 70154 "Purchase Order Subform Ext" extends "Purchase Order Subform"
{
    layout
    {
        addafter("Reserved Quantity")
        {
            field("Delivery Date"; Rec."TP_Delivery Date")
            {
                ApplicationArea = All;
                Caption = 'Delivery Date';
                ToolTip = 'Delivery Date';

            }
        }
    }
}
