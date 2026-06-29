namespace TigerpakBC.TigerpakBC;

using Microsoft.Sales.Archive;
using Microsoft.Sales.Document;

tableextension 70128 "Sales Header Archive TExt" extends "Sales Header Archive"
{
    fields
    {
        field(70310; "Quote Type"; Option)
        {
            Caption = 'Quote Type';
            DataClassification = ToBeClassified;
            OptionMembers = "RFQ - Request for Quote","CPL - Customer Price List","NBQ - New Business Quote"," ";
        }
        field(70311; CreatedBy; Text[100])
        {
            Caption = 'Created By';
            DataClassification = ToBeClassified;
            TableRelation = "Sales Header"."Created By" where("Document Type" = const(Order), "No." = field("No."));
            trigger OnValidate()
            var
                SH: Record "Sales Header";


            begin

                if SH.Get("Document Type"::Order, "No.") then
                    CreatedBy := SH."Created By";
            end;


        }
    }
}
