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
        modify("Document Date")
        {
            trigger OnAfterValidate()
            begin
                if "Document Date" > Today then    //StephanieH: warning in BC when you try and enter a supplier invoice with a document date that is later than the actual date.
                    Message('Document Date cannot be later than the current system date.');
            end;


        }
    }

    // trigger OnInsert()
    // begin
    //     if "Delivery Date" = 0D then
    //         "Delivery Date" := Today();
    // end;

    trigger OnInsert()   // Put warning message on Supplier Invoice - Tommy
    begin
        if "Document Type" = "Document Type"::Invoice then begin
            if "Document Date" > Today then
                Error('Document Date cannot be later than the current system date.');
        end;
    end;


}

