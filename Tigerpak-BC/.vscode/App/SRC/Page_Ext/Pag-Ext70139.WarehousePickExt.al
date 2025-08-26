namespace ALProject.ALProject;

using Microsoft.Warehouse.Activity;

pageextension 70139 "Warehouse Pick Ext" extends "Warehouse Pick"
{

    layout
    {
        addafter("Assignment Time")
        {
            field("Pick Created"; Rec."Pick Created Date time")
            {
                ApplicationArea = All;
                Caption = 'Pick Created';
                ToolTip = 'Specifies the time when the pick was created.';
                Editable = false;
            }
            field("Pick Completed"; Rec."Pick Completed Date time")
            {
                ApplicationArea = All;
                Caption = 'Pick Completed';
                ToolTip = 'Specifies the time when the pick was completed.';
                Editable = false;
            }


        }
    }
}
