namespace ALProject.ALProject;
using Microsoft.CRM.Contact;

pageextension 70129 "Master Sales Quote Ext" extends "Master Sales Quote"
{

    layout
    {
        addafter("Sell-to Customer Name")
        {
            field("Account Instructions"; Rec."Account Instructions")
            {
                ApplicationArea = All;
                ToolTip = 'Account Instructions';
                Editable = true;
            }

        }


        addafter(Status)
        {
            field("Quote Type"; Rec."Quote Type")
            {
                ApplicationArea = All;
                Caption = 'Quote Type';
                ToolTip = 'Quote Type';
                Editable = true;
                ShowMandatory = true;
            }
            field(Quote_Type_Text; Rec.Quote_Type_Text)
            {
                ApplicationArea = All;
                Caption = 'Quote Type Text';
                ToolTip = 'Quote Type Text';
                Editable = false;
            }

            field("Quote Outcome"; Rec."Quote Status")
            {
                ApplicationArea = All;
                Caption = 'Quote Outcome';
                ToolTip = 'Quote Outcome';
                Editable = true;
                ShowMandatory = true;
            }
            field(Quote_Outcome_Text; Rec.Quote_Outcome_Text)
            {
                ApplicationArea = All;
                Caption = 'Quote Outcome Text';
                ToolTip = 'Quote Outcome Text';
                Editable = false;
            }



        }


    }

    actions
    {
        addafter("Archive Document")
        {
            action(UpdateTPUnitCost_New)

            {
                AccessByPermission = TableData Contact = R;
                ApplicationArea = Basic, Suite;
                Caption = 'UpdateTPCostNew';

                //Enabled = ContactSelected;
                Image = UpdateUnitCost;
                ToolTip = 'Run the task to update TP unit cost_New and TP profit%_New';
                trigger OnAction()
                var
                    Updated: Boolean;
                begin
                    Updated := Rec.UpdateTPUnitCostNew();
                    if Updated then
                        Message('TP Unit cost_New and TP Profit%_New Updated!');
                end;
            }
        }
        modify(UpdateTPCost)
        {
            Visible = false;
        }


    }
}
