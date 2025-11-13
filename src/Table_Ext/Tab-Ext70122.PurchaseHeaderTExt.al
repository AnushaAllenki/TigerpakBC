namespace TigerpakBC.TigerpakBC;

using Microsoft.Purchases.Document;

tableextension 70122 "Purchase Header TExt" extends "Purchase Header"
{
    fields
    {
        field(70100; "Delivery Date"; Date)
        {

            Caption = 'Delivery Date';
            DataClassification = CustomerContent;

        }
    }

    trigger OnInsert()
    begin
        if "Delivery Date" = 0D then
            "Delivery Date" := Today();
    end;
}
