namespace ALProject.ALProject;

using Microsoft.Warehouse.Structure;

tableextension 70119 "Bin Content TExt" extends "Bin Content"
{
    fields
    {
        field(70100; "Blocked_Item"; Boolean)
        {
            Caption = 'Blocked Item';
            DataClassification = ToBeClassified;


        }
        field(70110; "HACCP Item"; Boolean)   //#288 HACCP Item added to Bincontents
        {
            Caption = 'HACCP Item';
            DataClassification = ToBeClassified;
            Editable = false;

        }

    }
}
