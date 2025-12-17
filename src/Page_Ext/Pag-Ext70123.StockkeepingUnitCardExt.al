namespace ALProject.ALProject;

using Microsoft.Inventory.Location;
using Microsoft.Inventory.Item;

pageextension 70123 "Stockkeeping Unit Card Ext" extends "Stockkeeping Unit Card"
{
    layout
    {
        addafter("Unit Cost")
        {
            field("TP Unit Cost_New"; rec."TP Unit Cost_New")
            {
                ApplicationArea = All;
                Caption = 'TP Unit Cost_New';

            }
        }
        addafter("TP Unit Cost_New")
        {
            field("Purchase Order Multiples"; Rec."Purchase Order Multiples")
            {
                ApplicationArea = All;
                Caption = 'Purchase Order Multiples';

            }
        }
        addafter("Assembly Policy")
        {
            field("Purcase MOQ Warning_TP"; Rec."Purcase MOQ Warning_TP")
            {
                ApplicationArea = All;
                Caption = 'Purcase MOQ Warning';

            }

            field("Purchase MOQ_TP"; Rec."Purchase MOQ_TP")
            {
                ApplicationArea = All;
                Caption = 'Purchase MOQ';
            }
        }
        addafter("Vendor Item No.")
        {
            field("Secondary Vendor No."; Rec."Secondary Vendor No.")    //#305 - Sendory vendor Field
            {
                ApplicationArea = All;
                Caption = 'Secondary Vendor No';

            }
        }

    }





}
