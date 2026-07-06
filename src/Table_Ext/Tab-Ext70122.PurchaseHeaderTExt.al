namespace TigerpakBC.TigerpakBC;

using Microsoft.Purchases.Document;
using Microsoft.Foundation.Address;

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
        field(70300; "Receiving Address"; Text[250])
        {
            Caption = 'Receiving Address';
            DataClassification = CustomerContent;
        }
        field(70302; "Receiving Address2"; Text[250])
        {
            Caption = 'Receiving Address2';
            DataClassification = CustomerContent;
        }
        field(70303; "Receiving City"; Text[30])
        {
            Caption = 'Receiving City';
            TableRelation = if ("Receiving Country/Region Code" = const('')) "Post Code".City
            else
            if ("Receiving Country/Region Code" = filter(<> '')) "Post Code".City where("Country/Region Code" = field("Receiving Country/Region Code"));
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                PostCode.LookupPostCode("Receiving City", "Receiving Post Code", "Receiving County", "Receiving Country/Region Code");
                //  OnAfterLookupCity(Rec, PostCode);
            end;

            trigger OnValidate()
            var
                IsHandled: Boolean;
            begin
                IsHandled := false;
                // OnBeforeValidateCity(Rec, PostCode, CurrFieldNo, IsHandled);
                if not IsHandled then
                    PostCode.ValidateCity("Receiving City", "Receiving Post Code", "Receiving County", "Receiving Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
                //OnAfterValidateCity(Rec, PostCode);
            end;
        }
        field(70304; "ReceivingPhone No."; Text[30])
        {
            Caption = 'Receiving Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(70305; "Receiving Country/Region Code"; Code[10])
        {
            Caption = 'Receiving Country/Region Code';
            TableRelation = "Country/Region";

            trigger OnValidate()
            begin
                PostCode.CheckClearPostCodeCityCounty("Receiving City", "Receiving Post Code", "Receiving County", "Receiving Country/Region Code", xRec."Receiving Country/Region Code");
            end;
        }
        field(70306; "Receiving Telex No."; Text[30])
        {
            Caption = 'Receiving Telex No.';
        }
        field(70307; "Receiving Fax No."; Text[30])
        {
            Caption = 'Receiving Fax No.';
        }
        field(70308; "Receiving Contact"; Text[100])
        {
            Caption = 'Contact';
        }
        field(70309; "Receiving Post Code"; Code[20])
        {
            Caption = 'Receiving Post Code';
            TableRelation = if ("Receiving Country/Region Code" = const('')) "Post Code"
            else
            if ("Receiving Country/Region Code" = filter(<> '')) "Post Code" where("Country/Region Code" = field("Receiving Country/Region Code"));
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                PostCode.LookupPostCode("Receiving City", "Receiving Post Code", "Receiving County", "Receiving Country/Region Code");
                //  OnAfterLookupPostCode(Rec, PostCode);
            end;

            trigger OnValidate()
            var
                IsHandled: Boolean;
            begin
                IsHandled := false;
                // OnBeforeValidatePostCode(Rec, PostCode, CurrFieldNo, IsHandled);
                if not IsHandled then
                    PostCode.ValidatePostCode("Receiving City", "Receiving Post Code", "Receiving County", "Receiving Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
                //OnAfterValidatePostCode(Rec, PostCode);
            end;
        }
        field(70310; "Receiving County"; Text[30])
        {
            CaptionClass = '5,1,' + "Receiving Country/Region Code";
            Caption = 'County';
        }
        field(70311; "Receiving E-Mail"; Text[80])
        {
            Caption = 'Receiving E-Mail';
            ExtendedDatatype = EMail;


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




var
        PostCode: Record "Post Code";

}

