namespace ALProject.ALProject;

using Microsoft.Inventory.Location;

pageextension 70122 "Location Card Ext" extends "Location Card"
{

    // layout
    // {
    //     addafter("Inflated cost %")
    //     {
    //         field("Provisional Cost%"; rec."Provisional Cost%")
    //         {
    //             Caption = 'Provisional Cost%';
    //             ApplicationArea = All;
    //             Visible = true;
    //             Editable = true;
    //         }
    //     }
    // }

    layout
    {
        addlast("Address & Contact")
        {
            group("WHSE Receiving Address")
            {
                Caption = 'Receiving Address';

                field("Receiving Address"; Rec."Receiving Address")
                {
                    Caption = 'Receiving Address';
                    ApplicationArea = All;
                    ToolTip = 'Warehouse Receiving Address';
                }
                field("Receiving Address2"; Rec."Receiving Address2")
                {
                    Caption = 'Receiving Address2';
                    ApplicationArea = All;
                    ToolTip = 'Warehouse Receiving Address 2';
                }
                field("Receiving City"; Rec."Receiving City")
                {
                    Caption = 'Receiving City';
                    ApplicationArea = All;
                    ToolTip = 'Warehouse Receiving City';
                }
                field("Receiving County"; Rec."Receiving County")
                {
                    Caption = 'Receiving County';
                    ApplicationArea = All;
                    ToolTip = 'Warehouse Receiving County';
                }
                field("Receiving Phone No."; Rec."ReceivingPhone No.")
                {
                    Caption = 'Receiving Phone No.';
                    ApplicationArea = All;
                    ToolTip = 'Warehouse Receiving Phone Number';

                }
                field("Receiving Country/Region Code"; Rec."Receiving Country/Region Code")
                {
                    Caption = 'Receiving Country/Region Code';
                    ApplicationArea = All;
                    ToolTip = 'Warehouse Receiving Country/Region Code';
                }
            }
        }
    }
}
