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
                caption = 'Receiving Address';
            }

            field("Receiving Address2"; Rec."Receiving Address2")
            {
                ApplicationArea = All;
                caption = 'Receiving Address2';
            }

            field("Receiving City"; Rec."Receiving City")
            {
                ApplicationArea = All;
                caption = 'Receiving City';
            }

            field("Receiving Post Code"; Rec."Receiving Post Code")
            {
                ApplicationArea = All;
                caption = 'Receiving Post Code';
            }

            field("Receiving County"; Rec."Receiving County")
            {
                caption = 'Receiving State';
                ApplicationArea = All;
            }

            field("Receiving Country/Region Code"; Rec."Receiving Country/Region Code")
            {
                ApplicationArea = All;
                caption = 'Receiving Country/Region Code';
            }

            field("ReceivingPhone No."; Rec."ReceivingPhone No.")
            {
                ApplicationArea = All;
                caption = 'Receiving Phone No.';
            }
        }
    }
}


