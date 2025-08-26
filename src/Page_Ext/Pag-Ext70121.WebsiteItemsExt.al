namespace ALProject.ALProject;

pageextension 70121 "Website Items Ext" extends "Website Items"
{

    layout
    {
        addafter("Unit Price")
        {
            field(LocationQty; LocationQty)
            {
                Caption = 'Location Qty';
                ApplicationArea = All;
            }
        }
    }
    var
        LocationQty: Text[200];

    trigger OnAfterGetRecord()
    begin
        rec.SetAutoCalcFields(Inventory_MEL, Inventory_SYD, Inventory_QLD, Inventory_WA, Inventory_SA);
        LocationQty := 'SYD:' + format(rec.Inventory_SYD) + '; MEL:' + format(Rec.Inventory_MEL) + '; QLD:' + Format(Rec.Inventory_QLD) + '; PER:' + Format(Rec.Inventory_WA) + '; SA:' + format(Rec.Inventory_SA);
    end;
}