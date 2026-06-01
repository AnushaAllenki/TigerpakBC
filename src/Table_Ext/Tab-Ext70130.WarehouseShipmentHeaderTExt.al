tableextension 70130 "Warehouse Shipment Header TExt" extends "Warehouse Shipment Header"
{
    fields
    {
        field(70100; "Your Reference"; Text[100])  // Copying Your Reference from sales order to  wshe shipments for web services API
        {
            Caption = 'Your Reference';
            DataClassification = ToBeClassified;

        }

        field(70101; "Web Order No."; Text[100])  // Copying Your Reference from sales order to  wshe shipments for web services API
        {
            Caption = 'Web Order No.';
            DataClassification = ToBeClassified;
        }
    }
}
