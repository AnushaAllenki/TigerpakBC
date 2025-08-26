namespace ALProject.ALProject;

using Microsoft.Inventory.Item;
using Microsoft.Finance.GeneralLedger.Setup;

tableextension 70116 "Item Templ. TExt" extends "Item Templ."
{
    fields
    {
        field(70111; "Item Category Group"; Option)
        {

            Caption = 'Item Category Group';
            DataClassification = ToBeClassified;
            OptionMembers = " ","Adhesive & Wrapping Solutions","Primary Packaging Materials","Shipping & Protective Solutions","Industrial & Workplace Essentials";

        }

        field(70113; "Gen. Prod. Posting Group New"; Code[20])
        {
            Caption = 'Gen. Prod. Posting Group';
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Product Posting Group".code where("Item Category Group" = field("Item Category Group"));

            trigger OnValidate()
            var
                GenProdPostingGroup: Record "Gen. Product Posting Group";
            begin
                Validate("Gen. Prod. Posting Group", "Gen. Prod. Posting Group New");
            end;
        }
    }
}

