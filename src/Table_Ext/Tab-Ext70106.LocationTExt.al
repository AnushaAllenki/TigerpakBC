namespace ALProject.ALProject;

using Microsoft.Inventory.Location;
using System.EMail;
using Microsoft.Foundation.Address;

tableextension 70106 "Location TExt" extends Location
{
    // fields
    // {
    //     field(70100; "Provisional Cost%"; Decimal)
    //     {
    //         Caption = 'Provisional Cost%';
    //         DataClassification = ToBeClassified;
    //     }



    // }

    fields
    {
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
            TableRelation = if ("Country/Region Code" = const('')) "Post Code".City
            else
            if ("Country/Region Code" = filter(<> '')) "Post Code".City where("Country/Region Code" = field("Country/Region Code"));
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                PostCode.LookupPostCode("Receiving City", "Post Code", "Receiving County", "Country/Region Code");
                //  OnAfterLookupCity(Rec, PostCode);
            end;

            trigger OnValidate()
            var
                IsHandled: Boolean;
            begin
                IsHandled := false;
                // OnBeforeValidateCity(Rec, PostCode, CurrFieldNo, IsHandled);
                if not IsHandled then
                    PostCode.ValidateCity("Receiving City", "Post Code", "Receiving County", "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
                //OnAfterValidateCity(Rec, PostCode);
            end;
        }
        field(70304; "ReceivingPhone No."; Text[30])
        {
            Caption = 'Receiving Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(70305; "Receiving Phone No. 2"; Text[30])
        {
            Caption = 'Receiving Phone No. 2';
            ExtendedDatatype = PhoneNo;
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
            TableRelation = if ("Country/Region Code" = const('')) "Post Code"
            else
            if ("Country/Region Code" = filter(<> '')) "Post Code" where("Country/Region Code" = field("Country/Region Code"));
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                PostCode.LookupPostCode("Receiving City", "Post Code", "Receiving County", "Country/Region Code");
                //  OnAfterLookupPostCode(Rec, PostCode);
            end;

            trigger OnValidate()
            var
                IsHandled: Boolean;
            begin
                IsHandled := false;
                // OnBeforeValidatePostCode(Rec, PostCode, CurrFieldNo, IsHandled);
                if not IsHandled then
                    PostCode.ValidatePostCode("Receiving City", "Post Code", "Receiving County", "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
                //OnAfterValidatePostCode(Rec, PostCode);
            end;
        }
        field(70310; "Receiving County"; Text[30])
        {
            CaptionClass = '5,1,' + "Country/Region Code";
            Caption = 'County';
        }
        field(70311; "Receiving E-Mail"; Text[80])
        {
            Caption = 'Receiving E-Mail';
            ExtendedDatatype = EMail;

            trigger OnValidate()
            var
                MailManagement: Codeunit "Mail Management";
            begin
                MailManagement.ValidateEmailAddressField("Receiving E-Mail");
            end;
        }

    }
    var
        PostCode: Record "Post Code";
}
