namespace ALProject.ALProject;

using Microsoft.Finance.GeneralLedger.Setup;

tableextension 70110 "Gen. Product Posting GroupTExt" extends "Gen. Product Posting Group"
{
    fields
    {
        field(70100; "Item Category Group"; Option)
        {
            Caption = 'Item Category Group';
            DataClassification = ToBeClassified;
            OptionMembers = " ","Adhesive & Wrapping Solutions","Primary Packaging Materials","Shipping & Protective Solutions","Industrial & Workplace Essentials";

        }
    }




}