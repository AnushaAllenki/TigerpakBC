namespace ALProject.ALProject;

using Microsoft.Purchases.Document;
using Microsoft.Inventory.Item;

tableextension 70120 "Purchase Line TExt" extends "Purchase Line"
{
    fields
    {
        field(70100; "Purchaser Code"; Code[20])
        {
            Caption = 'Purchaser Code';
            DataClassification = ToBeClassified;
        }

        field(70111; "Item Category Group"; Option)
        {
            Caption = 'Item Category Group';
            DataClassification = ToBeClassified;
            OptionMembers = " ","Adhesive & Wrapping Solutions","Primary Packaging Materials","Shipping & Protective Solutions","Industrial & Workplace Essentials";

        }
    }


    trigger OnInsert()
    var
        Item: Record Item;
    begin
        Item.Get(Rec."No.");
        Rec."Item Category Group" := Item."Item Category Group";
    end;
}
