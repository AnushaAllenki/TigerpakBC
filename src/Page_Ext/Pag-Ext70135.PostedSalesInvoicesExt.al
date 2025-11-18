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
            field("Created By"; Rec."Created By")
            {
                ApplicationArea = All;
                Caption = 'Created By';
                ToolTip = 'Specifies the user that created the posted sales invoice.';
            }
            field("Picked By"; Rec."Picked By")
            {
                ApplicationArea = All;
                Caption = 'Picked By';
                ToolTip = 'Specifies the user that created the pick for the posted sales invoice.';
            }
            field("Packed By"; Rec."Packed By")
            {
                ApplicationArea = All;
                Caption = 'Packed By';
                ToolTip = 'Specifies the user that created the pack for the posted sales invoice.';
            }
            field("Your Reference"; Rec."Your Reference")
            {
                ApplicationArea = All;
                Caption = 'Your Reference';
                ToolTip = 'Specifies your reference for the posted sales invoice.';
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
    }

}
