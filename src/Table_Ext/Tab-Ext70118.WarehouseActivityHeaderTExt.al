namespace ALProject.ALProject;

using Microsoft.Warehouse.Activity;

tableextension 70118 "Warehouse Activity Header TExt" extends "Warehouse Activity Header"
{
    fields
    {
        field(70110; "Pick Created Date time"; DateTime)
        {
            Caption = 'Pick Created Date time';
            DataClassification = ToBeClassified;
        }

        field(70111; "Pick Completed Date time"; DateTime)
        {
            Caption = 'Pick Completed Date time';
            DataClassification = ToBeClassified;
        }
    }

    trigger OnAfterInsert()
    begin
        if Type = Type::Pick then begin
            "Pick Created Date time" := CurrentDateTime();
            Modify();
        end;
    end;
}
