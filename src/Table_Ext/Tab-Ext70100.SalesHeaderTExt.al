tableextension 70100 "Sales Header T-Ext" extends "Sales Header"
{
    fields
    {
        field(70100; OnHold; Boolean)
        {
            Caption = 'On Hold';
            DataClassification = ToBeClassified;
        }
        modify("On Hold")
        {
            Caption = ' On Hold Not in use';

        }

        field(70110; "Customer Grading"; Code[20])
        {

            Caption = 'Customer Grading';
            DataClassification = ToBeClassified;
            TableRelation = "Customer Grading";

        }

        field(70120; "Total Cost_New"; Decimal)
        {
            Caption = 'Total Cost_New';
            DataClassification = ToBeClassified;



        }
        field(70130; "Margin Amount_New"; Decimal)
        {
            Caption = 'Margin Amount_New';
            DataClassification = ToBeClassified;
        }
        field(70140; "Margin %_New"; Decimal)
        {
            Caption = 'Margin %_New';
            DataClassification = ToBeClassified;
        }

        modify("sell-to Customer No.")
        {
            trigger OnAfterValidate()
            var
                Customer: Record Customer;
            begin
                if Customer.get("Sell-to Customer No.") then begin
                    "Account Instructions" := Customer."Account Instructions";

                end;
            end;
        }

        field(70150; "Alt Address"; Text[200])
        {
            Caption = 'Alt Address';
            DataClassification = CustomerContent;
            Editable = false;

        }


        field(70301; "Auto Email - Post"; Boolean)
        {
            Caption = 'Auto Email - Post';
            DataClassification = ToBeClassified;
        }

        field(70310; "Quote Type"; Option)
        {
            Caption = 'Quote Type';
            DataClassification = ToBeClassified;
            OptionMembers = " ","RFQ - Request for Quote","CPL - Customer Price List","NBQ - New Business Quote";

        }

        field(70320; "Quote Status"; Option)
        {
            Caption = 'Quote Status';
            DataClassification = ToBeClassified;
            OptionMembers = " ","Won","Lost";


        }




        modify("Ship-to Address")
        {
            trigger OnAfterValidate()
            begin
                if rec."Ship-to Address" <> rec."Sell-to Address" then
                    rec."Alt Address" := 'Alternate Address'
                else
                    rec."Alt Address" := '';
            end;
        }
    }


}









