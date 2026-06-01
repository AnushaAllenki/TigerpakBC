tableextension 70131 "Posted Whse.ShipmentHeader Ext" extends "Posted Whse. Shipment Header"
{
    fields
    {
        field(70100; "Your Reference"; Text[100])  // Copying Your Reference from sales order to posted wshe shipments for web services API
        {
            Caption = 'Your Reference';
            DataClassification = ToBeClassified;
        }

        field(70101; "Web Order No."; Text[100])  // Copying Your Reference from sales order to posted wshe shipments for web services API
        {
            Caption = 'Web Order No.';
            DataClassification = ToBeClassified;
        }
    }
}
