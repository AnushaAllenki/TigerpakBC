namespace ALProject.ALProject;

using Microsoft.Sales.History;

tableextension 70115 "Sales Invoice Line Ext" extends "Sales Invoice Line"
{
    fields
    {
        field(70100; "TP Unit Cost_New"; Decimal)
        {
            Caption = 'TP Unit Cost_New';
            DataClassification = ToBeClassified;
        }
        field(70101; "External Document No."; Code[50])  // #290 Posted Sales Invoice Lines - External Document No. field update from Sales Invoice Header
        {
            Caption = 'External Document No.';
            DataClassification = ToBeClassified;


        }
        field(70102; "Item Category Group"; Option)
        {
            Caption = 'Item Category Group';
            DataClassification = ToBeClassified;
            OptionMembers = " ","Adhesive & Wrapping Solutions","Primary Packaging Materials","Shipping & Protective Solutions","Industrial & Workplace Essentials";
        }
        field(70140; Blocked_Item; Boolean)
        {
            Caption = 'Blocked Item';
            DataClassification = ToBeClassified;
        }

        field(70103; "Blocked_Days Since"; Integer)
        {
            Caption = 'Blocked Days Since';
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(Key12; "Item Category Group")
        {
        }
    }
}
