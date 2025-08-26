namespace ALProject.ALProject;

using Microsoft.Warehouse.Activity.History;

pageextension 70138 "Registered Whse. Put-aways Ext" extends "Registered Whse. Put-aways"
{

    layout
    {
        addafter("location Code")
        {


            field("Source No."; Rec."Source No.")
            {
                ApplicationArea = All;
                Caption = 'Source No.';
                ToolTip = 'Specifies the source document for the warehouse put-away.';
                Editable = false;



            }




        }
    }

    actions
    {
        addafter("Co&mments")
        {
            action("Update Source No.")
            {
                ApplicationArea = All;
                Caption = 'Update Source No.';
                Image = Action;

                trigger OnAction()
                var
                    EventSub: Codeunit "EventSubscribers1";
                begin
                    EventSub.UpdateAllSN();
                end;
            }
        }
    }
}

