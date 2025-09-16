namespace TigerpakBC.TigerpakBC;

using Microsoft.Purchases.Document;
using Microsoft.Inventory.Item;

tableextension 70120 "Purchase Line TExt" extends "Purchase Line"
{
    fields
    {
        field(70111; "Item Category Group"; Option)
        {
            Caption = '';
            DataClassification = ToBeClassified;
            OptionMembers = " ","Adhesive & Wrapping Solutions","Primary Packaging Materials","Shipping & Protective Solutions","Industrial & Workplace Essentials";
            // trigger OnValidate()
            // var
            //     Item: Record Item;
            // begin
            //     Item.Get(Rec."No.");
            //     Rec."Item Category Group" := Item."Item Category Group";

            // end;
        }


    }

    trigger OnInsert()
    var
        Item: Record Item;
    begin
        if Rec."No." <> '' then
            if Rec.Type = Rec.Type::Item then
                Item.Get(Rec."No.");
        Rec."Item Category Group" := Item."Item Category Group";
    end;


}
