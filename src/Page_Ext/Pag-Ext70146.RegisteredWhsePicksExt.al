namespace TigerpakBC.TigerpakBC;

using Microsoft.Warehouse.Activity.History;

pageextension 70146 "Registered Whse. Picks Ext" extends "Registered Whse. Picks"
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
