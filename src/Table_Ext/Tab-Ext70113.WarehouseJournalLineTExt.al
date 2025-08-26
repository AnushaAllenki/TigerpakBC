namespace ALProject.ALProject;

using Microsoft.Warehouse.Journal;

tableextension 70113 "Warehouse Journal Line TExt" extends "Warehouse Journal Line"
{
    fields
    {
        field(70100; "Narrative"; Text[250])
        {

            Caption = 'Narrative';
            DataClassification = ToBeClassified;
        }
    }
}
