namespace TigerpakBC.TigerpakBC;

using Microsoft.Purchases.Document;

tableextension 70123 "Purchase Header TExt" extends "Purchase Header"
{
    fields
    {
        field(70100; "Delivery Date"; Date)
        {

            Caption = 'Delivery Date';
            DataClassification = CustomerContent;

        }
        field(70101; "Container Configuration"; Option)
        {
            Caption = 'Container Configuration';
            DataClassification = CustomerContent;
            OptionMembers = " ",Courier,"Live Unload","Side Loader","Side Loader/Hand Unload";
        }

        field(70102; "Freight Forwarder"; Option)
        {
            Caption = 'Freight Forwarder';
            DataClassification = CustomerContent;
            OptionMembers = " ",Crane,Mainfreight,Crystal;
        }

        field(70103; "Container No."; Text[200])
        {
            Caption = 'Container No.';
            DataClassification = ToBeClassified;
        }
    }

    // trigger OnInsert()
    // begin
    //     if "Delivery Date" = 0D then
    //         "Delivery Date" := Today();
    // end;
}
