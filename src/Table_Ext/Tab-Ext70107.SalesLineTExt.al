namespace ALProject.ALProject;
using Microsoft.Sales.Document;
using Microsoft.Inventory.Item;
using Microsoft.Inventory.Location;
using Microsoft.Warehouse.Activity;

tableextension 70107 "Sales Line TExt" extends "Sales Line"
{
    fields
    {

        field(70100; "TP Unit Cost_New"; Decimal)
        {
            Caption = 'TP Unit Cost';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if "Unit Price" = 0 then
                    "TP Profit%_New" := 0
                else
                    "TP Profit%_New" := Round((("Unit Price" - "TP Unit Cost_New") / "Unit Price") * 100, 0.01, '=')
            end;

        }

        field(70110; "TP Profit%_New"; Decimal)
        {
            Caption = 'TP Profit%_New';
            DataClassification = ToBeClassified;

        }

        field(70120; "WH Exist"; Boolean)  //The field was hidden in page because not in use as logic s not working properly.
        {
            Caption = 'WH Exist';
            DataClassification = ToBeClassified;



            trigger OnValidate()
            var
                SH: Record "Sales Header";

            begin
                SH.SetRange("No.", Rec."Document No.");
                if SH.FindFirst() then
                    Rec."WH Exist" := SH."WH Exist";
            end;
        }

        field(70121; "WH_Exist_API"; Boolean)  // field added for API page AzureSalesLines - Tommy
        {
            FieldClass = FlowField;
            Caption = 'WH Exist';
            Editable = false;
            CalcFormula = exist("Warehouse Activity Line" where("Source No." = FIELD("Document No.")));
        }


        modify("Unit of Measure Code")
        {
            trigger OnAfterValidate()
            var
                IUOM: Record "Item Unit of Measure";
                SKUrec: Record "Stockkeeping Unit";
            begin

                if IUOM.get(Rec."No.", rec."Unit of Measure Code") then begin
                    "Cubage" := IUOM.Cubage;
                    "Net Weight" := IUOM.Weight;
                end;
                SKUrec.Reset();
                SKUrec.SetRange("Item No.", "No.");
                SKUrec.SetRange("Location Code", "Location Code");
                if SKUrec.FindFirst() then
                    Validate("TP Unit Cost_New", SKUrec."Tp Unit Cost_New" * "Qty. per Unit of Measure")
                else
                    Validate("TP Unit Cost_New", rec."Unit Cost");
            end;
        }
        modify("Location Code")
        {
            trigger OnAfterValidate()
            var
                SKUrec: Record "Stockkeeping Unit";

            begin
                SKUrec.Reset();
                SKUrec.SetRange("Item No.", "No.");
                SKUrec.SetRange("Location Code", "Location Code");
                if SKUrec.FindFirst() then
                    Validate("TP Unit Cost_New", SKUrec."Tp Unit Cost_New" * "Qty. per Unit of Measure")
                else
                    Validate("TP Unit Cost_New", rec."Unit Cost" * "Qty. per Unit of Measure");
            end;
        }

        modify("Unit Price")

        {
            trigger OnAfterValidate()
            begin
                if "Unit Price" < "TP Unit Cost" then begin

                    Message('Attention! Unit Price is less than TP Unit Cost');

                end;

                if "Unit Price" = 0 then
                    "TP Profit%_New" := 0
                else
                    "TP Profit%_New" := Round((("Unit Price" - "TP Unit Cost_New") / "Unit Price") * 100, 0.01, '=')
            end;
        }
        modify("Unit Cost (LCY)")
        {
            trigger OnAfterValidate()
            begin
                if "Unit Price" = 0 then
                    "TP Profit%_New" := 0
                else
                    "TP Profit%_New" := Round((("Unit Price" - "TP Unit Cost_New") / "Unit Price") * 100, 0.01, '=')
            end;
        }
    }

    trigger OnAfterInsert()
    var
        SKU: Record "Stockkeeping Unit";
    begin
        SKU.SetRange("item No.", Rec."No.");
        SKU.SetRange("Location Code", Rec."Location Code");
        if SKU.FindFirst() then begin
            Rec."TP Unit Cost_New" := SKU."TP Unit Cost_New";
            Rec.Modify();
        end;
    end;

    // trigger OnAfterModify()
    // var
    //     SalesHeader: Record "Sales Header";
    // begin
    //     SalesHeader.SetRange("No.", Rec."Document No.");
    //     if SalesHeader.FindFirst() then begin
    //         SalesHeader."Total Cost_new" += Rec."TP Unit Cost_New" * Rec."Quantity";
    //         SalesHeader.CalcFields(Amount, "Amount Including VAT");
    //         SalesHeader."Margin Amount_New" := SalesHeader."Amount Including VAT" - SalesHeader."Total Cost_new";
    //         SalesHeader."Margin %_New" := (SalesHeader."Amount Including VAT" - SalesHeader."Total Cost_new") / SalesHeader."Total Cost_new" * 100;
    //         SalesHeader.Modify();
    //     end;


    //end;
    var
        SKU: Record "Stockkeeping Unit";
        Location: Record "Location";
}
