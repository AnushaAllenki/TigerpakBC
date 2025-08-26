namespace ALProject.ALProject;

using Microsoft.Warehouse.Ledger;

tableextension 70112 "Warehouse Entry TExt" extends "Warehouse Entry"
{
    fields
    {
        field(70100; "Narrative"; Text[250])
        {

            Caption = 'Narrative';
            ToolTip = 'Enter a narrative for the warehouse entry.';
            DataClassification = ToBeClassified;
        }

    }
}
