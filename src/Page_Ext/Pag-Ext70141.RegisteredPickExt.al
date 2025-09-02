namespace ALProject.ALProject;

using Microsoft.Warehouse.Activity.History;

pageextension 70141 "Registered Pick Ext" extends "Registered Pick"
{
    layout
    {
        addafter("Assignment Time")
        {
            field("Pick Created Date Time"; Rec."Pick Created Date time")
            {
                ApplicationArea = All;
                Caption = 'Pick Created Date Time';
                ToolTip = 'Specifies the time when the pick was created.';
                Editable = false;
            }
            field("Pick Completed Date Time"; Rec."Pick Completed Date time")
            {
                ApplicationArea = All;
                Caption = 'Pick Completed Date Time';
                ToolTip = 'Specifies the time when the pick was completed.';
                Editable = false;
            }

            field("Pick Duration"; Rec."Pick Duration")
            {
                ApplicationArea = All;
                Caption = 'Pick Duration';
                ToolTip = 'Specifies the duration of the pick operation.';
                Editable = false;
            }

            field("Pick Duration in Min"; Rec."Pick Duration in Min")
            {
                ApplicationArea = All;
                Caption = 'Pick Duration in Min';
                ToolTip = 'Specifies the duration of the pick operation in minutes.';
                Editable = false;
            }
        }
    }
}
