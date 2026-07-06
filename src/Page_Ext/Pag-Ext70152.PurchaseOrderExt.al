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
        addafter("Remit-to Code")
        {
            field("Receiving Address"; Rec."Receiving Address")
            {
                ApplicationArea = All;
            }
            field("Receiving Address2"; Rec."Receiving Address2")
            {
                ApplicationArea = All;
            }
            field("Receiving City"; Rec."Receiving City")
            {
                ApplicationArea = All;
            }
            field("Receiving County"; Rec."Receiving County")
            {
                ApplicationArea = All;
            }
            field("Receiving Post Code"; Rec."Receiving Post Code")
            {
                ApplicationArea = All;
            }
            field("Receiving Phone No."; Rec."ReceivingPhone No.")
            {
                ApplicationArea = All;
            }
        }
    }
}
