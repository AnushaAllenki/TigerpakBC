namespace TigerpakBC.TigerpakBC;

using Microsoft.Warehouse.Document;

pageextension 70151 "Warehouse Shipment Ext" extends "Warehouse Shipment"
{
    layout
    {
        addafter("Assignment Time")
        {
            field(SystemCreatedAt; Rec.SystemCreatedAt)
            {
                ApplicationArea = All;
                Caption = 'System Created At';
                Editable = false;
            }
            field("Your Reference"; Rec."Your Reference")
            {
                ApplicationArea = All;
                Caption = 'Your Reference';
                Editable = false;
            }
            field("Web Order No."; Rec."Web Order No.")
            {
                ApplicationArea = All;
                Caption = 'Web Order No.';
                Editable = false;
            }


        }
    }
}
