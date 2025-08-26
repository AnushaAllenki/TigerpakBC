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
    }
}
