tableextension 70128 "Warehouse Shipment Header TExt" extends "Warehouse Shipment Header"
{
    fields
    {
        field(70100; "Your Reference"; Text[100])  // Copying Your Reference from sales order to  wshe shipments for web services API
        {
            Caption = 'Your Reference';
            DataClassification = ToBeClassified;

            // trigger OnValidate()
            // begin
            //     if CopyStr(Rec."Your Reference", 1, 3) = 'WEB' then
            //         Rec."Web Order No." := CopyStr(Rec."Your Reference", 4)  // Web order number from sales order for web services
            //     else
            //         Rec."Web Order No." := '';
            // end;
        }

        field(70101; "Web Order No."; Text[100])  // Copying Your Reference from sales order to  wshe shipments for web services API
        {
            Caption = 'Web Order No.';
            DataClassification = ToBeClassified;
        }
    }
}
