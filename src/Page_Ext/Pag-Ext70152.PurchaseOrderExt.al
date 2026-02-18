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

            field("Container Configuration"; Rec."Container Configuration")
            {
                ApplicationArea = All;
            }

            field("Freight Forwarder"; Rec."Freight Forwarder")
            {
                ApplicationArea = All;
            }

            field("Container No."; Rec."Container No.")
            {
                ApplicationArea = All;
            }
        }
    }
}
