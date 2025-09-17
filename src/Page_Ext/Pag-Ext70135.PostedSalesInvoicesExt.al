namespace ALProject.ALProject;

using Microsoft.Sales.History;

pageextension 70135 "Posted Sales Invoices Ext" extends "Posted Sales Invoices"
{

    layout
    {
        addafter("margin amount")
        {
            field("Margin Amount_New"; Rec."Margin Amount_New")
            {
                ApplicationArea = All;
                Caption = 'Margin Amount_New';
                ToolTip = 'The Margin Amount_New field shows the new margin amount for the posted sales invoice.';
            }

            field("Margin %_New"; Rec."Margin %_New")
            {
                ApplicationArea = All;
                Caption = 'Margin %_New';
                ToolTip = 'The Margin %_New field shows the new margin percentage for the posted sales invoice.';
            }

            field("Pick Duration in Mins"; Rec."Pick Duration in Mins")
            {
                ApplicationArea = All;
                Caption = 'Pick Duration in Mins';
                ToolTip = 'The Pick Duration field shows the pick duration for the posted sales invoice.';
            }

        }
    }

    actions
    {
        addafter("Update Document")
        {
            action("Update All Inv Margin Amounts_New")
            {
                ApplicationArea = All;
                Caption = 'Update All Inv Margin Amounts_New';
                Image = Action;


                trigger OnAction()
                var
                    EventSub: Codeunit "EventSubscribers1";
                begin
                    EventSub.UpdateAllIMA();


                end;



            }
        }



        addafter("Update Document")
        {
            action("Update Pick Duration")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Update Pick Duration';
                Ellipsis = true;
                Image = Action;

                trigger OnAction()
                var
                    EventSub: Codeunit "EventSubscribers1";
                begin
                    EventSub.UpdatePickDuration();

                end;
            }

        }
    }

}
