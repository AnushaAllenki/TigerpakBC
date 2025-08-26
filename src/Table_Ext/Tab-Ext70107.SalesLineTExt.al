namespace ALProject.ALProject;
using Microsoft.Sales.Document;
using Microsoft.Inventory.Location;

tableextension 70107 "Sales Line TExt" extends "Sales Line"
{
    fields
    {

        field(70100; "TP Unit Cost_New"; Decimal)
        {
            Caption = 'TP Unit Cost';
            DataClassification = ToBeClassified;






        }






        modify("Unit Price")

        {
            trigger OnAfterValidate()
            begin
                if "Unit Price" < "TP Unit Cost" then begin

                    Message('Attention! Unit Price is less than TP Unit Cost');

                end;
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
