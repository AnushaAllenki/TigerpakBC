namespace TigerpakBC.TigerpakBC;

using Microsoft.Warehouse.Document;

pageextension 70150 "Warehouse Shipment Ext" extends "Warehouse Shipment"
{
    layout
    {
        addafter("Assignment Time")
        {
            field(SystemCreatedAt; Rec.SystemCreatedAt)  // #299 - Expose fields to Web Services
            {
                ApplicationArea = All;
                Caption = 'System Created At';
                Editable = false;
            }
        }
    }
}
