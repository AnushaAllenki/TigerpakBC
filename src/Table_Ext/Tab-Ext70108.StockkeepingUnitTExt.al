namespace ALProject.ALProject;

using Microsoft.Inventory.Location;
using Microsoft.Sales.Document;
using Microsoft.Sales.History;
using Microsoft.Inventory.Item;

tableextension 70108 "Stockkeeping Unit TExt" extends "Stockkeeping Unit"
{
    fields
    {
        field(70100; "TP Unit Cost_New"; Decimal)
        {
            Caption = 'TP Unit Cost_New';
            DataClassification = ToBeClassified;


            trigger OnValidate()
            var
                salesLine: Record "Sales Line";
            begin
                salesLine.SetRange("No.", Rec."Item No.");
                salesLine.SetRange("Location Code", Rec."Location Code");
                if salesLine.FindFirst() then
                    repeat
                        salesLine."TP Unit Cost_New" := Rec."TP Unit Cost_New";
                        salesLine.Modify();
                    until salesLine.Next() = 0;
            end;

        }

        field(70101; "Purchase Order Multiples"; Code[20])
        {
            Caption = 'Purchase Order Multiples';
            DataClassification = ToBeClassified;
            TableRelation = "Item Unit of Measure".code where("Item No." = field("Item No."), Code = field("Purchase Order Multiples"));
        }

        field(70102; "Purcase MOQ Warning_TP"; Boolean)
        {
            Caption = 'Purcase MOQ Warning';
            DataClassification = ToBeClassified;

        }

        field(70103; "Purchase MOQ_TP"; Decimal)
        {
            Caption = 'Purchase MOQ';
            DataClassification = ToBeClassified;

        }
    }



    trigger OnModify()
    var

        item: Record Item;


    //Location: Record "Location";
    begin
        if item.get(Rec."Item No.") then begin
            Rec."TP Unit Cost_New" := Rec."TP Unit Cost" - (Rec."TP Unit Cost") * item."Provisional Cost%" / 100;

        end;
    end;


}
