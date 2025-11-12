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
        }
    }
}
