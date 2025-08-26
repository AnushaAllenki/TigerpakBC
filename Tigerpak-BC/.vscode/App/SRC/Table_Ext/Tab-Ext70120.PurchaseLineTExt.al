namespace ALProject.ALProject;

using Microsoft.Purchases.Document;

tableextension 70120 "Purchase Line TExt" extends "Purchase Line"
{
    fields
    {
        field(70100; "Purchaser Code"; Code[20])
        {
            Caption = 'Purchaser Code';
            DataClassification = ToBeClassified;
        }

        field(70110; "Item Category Group"; Option)
        {
            Caption = 'Item Category Group';
            DataClassification = ToBeClassified;
            OptionMembers = " ","Adhesive & Wrapping Solutions","Primary Packaging Materials","Shipping & Protective Solutions","Industrial & Workplace Essentials";

        }
    }
}
