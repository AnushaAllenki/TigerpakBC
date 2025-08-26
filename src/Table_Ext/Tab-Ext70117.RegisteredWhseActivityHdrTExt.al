namespace ALProject.ALProject;

using Microsoft.Warehouse.Activity.History;

tableextension 70117 "RegisteredWhse.ActivityHdrTExt" extends "Registered Whse. Activity Hdr."
{
    fields
    {
        field(70100; "Source No."; Code[20])
        {

            Caption = 'Source No.';
            // DataClassification = ToBeClassified;
            FieldClass = FlowField;
            CalcFormula = min("Registered Whse. Activity Line"."Source No." where("No." = field("No.")));
            ToolTip = 'Specifies the source document for the warehouse activity.';
        }

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

        field(70112; "Pick Duration"; Duration)
        {
            Caption = 'Pick Duration';
            DataClassification = ToBeClassified;
            // CalcFormula = "Pick Completed Date time" - "Pick Created Date time";
            ToolTip = 'Specifies the duration of the pick operation.';
            Editable = false;
        }
    }


}
