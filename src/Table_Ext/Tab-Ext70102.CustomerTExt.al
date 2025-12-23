tableextension 70102 Customer_TExt extends Customer
{
    fields
    {
        field(70100; "Xmas Trading Hours"; Text[50])
        {
            Caption = 'Xmas Trading Hours';
            DataClassification = ToBeClassified;
        }

        modify("Primary Contact No.")  // #286 - Inactive Contact - To prevent selection of inactive contact in Customer Card
        {
            TableRelation = Contact where("No." = FIELD("Primary Contact No."), Status = FILTER('Active'));

            trigger OnAfterValidate()
            var
                ContactRec: Record Contact;
            begin
                if "Primary Contact No." <> '' then begin
                    if ContactRec.get(Rec."Primary Contact No.") then begin
                        //Rec."E-Mail" := ContactRec."E-Mail";
                        if ContactRec.Status = 'Inactive' then
                            Error('This contact is inactive');
                    end;
                end;
            end;
        }

        // field(70102; Industry; Text[50])
        // {
        //     Caption = 'Industry';
        //     DataClassification = ToBeClassified;
        // }

        field(70103; Reseller; Boolean)
        {
            Caption = 'Reseller';
            DataClassification = ToBeClassified;
        }
        field(70104; "Marketing Industry"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Marketing Industry';
            TableRelation = "Marketing Industry SubCategory"."Marketing Subcategory" where("Marketing Subcategory" = FIELD("Marketing Industry"));
        }



        field(70106; "Marginamount_12months"; Decimal)
        {
            Caption = 'Marginamount_12months';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Sales Invoice Header"."Margin Amount_New" where("Sell-to Customer No." = field("No."), "Posting Date" = field("Date Filter")));
        }
        FIELD(70107; "This Qrtr Sales Amount"; Decimal)
        {
            Caption = 'This Qtr Sales Amount';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Sales Invoice Line"."Line Amount" where("Sell-to Customer No." = field("No."), "Posting Date" = field("Qrtr Date Filter")));
        }
        field(70108; "Qrtr Date Filter"; Date)
        {
            Caption = 'Qrtr Date Filter';
            FieldClass = FlowFilter;

        }
        field(70109; "Last Qrtr Sales Amount"; Decimal)
        {
            Caption = 'Last Qrtr Sales Amount';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Sales Invoice Line"."Line Amount" where("Sell-to Customer No." = field("No."), "Posting Date" = field("Last Qrtr Date Filter")));
        }
        field(70110; "Last Qrtr Date Filter"; Date)
        {
            Caption = 'Last Qtr Date Filter';
            FieldClass = FlowFilter;
        }

    }

    trigger OnInsert()
    var
        Contact: Record Contact;
    begin
        if "Primary Contact No." <> '' then begin
            if Contact.get(Rec."Primary Contact No.") then begin
                Rec."E-Mail" := Contact."E-Mail";
            end;
        end;
    end;

    trigger OnModify()
    var
        EventSub: Codeunit "EventSubscribers1";
    begin
        EventSub.CalcGrosMarginLast12Months(Rec."No.");
    end;





}
