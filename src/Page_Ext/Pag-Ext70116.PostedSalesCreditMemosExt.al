pageextension 70116 "Posted Sales Credit Memos Ext" extends "Posted Sales Credit Memos"
{
    layout
    {
        addafter(Amount)
        {
            // field("Total Cost"; Rec."Total Cost")
            // {
            //     ApplicationArea = All;
            //     Caption = 'Total Cost';
            //     Editable = false;
            //     ToolTip = 'Total Cost';
            // }

            field("Margin Amount"; Rec."Margin Amount")
            {
                ApplicationArea = All;
                Caption = 'Margin Amount';
                Editable = false;
                ToolTip = 'Margin Amount';
            }
            field("Margin %"; Rec."Margin %")
            {
                ApplicationArea = All;
                Caption = 'Margin %';
                Editable = false;
                ToolTip = 'Margin %';
            }

        }
    }

    actions
    {
        addafter("update document")
        {
            action("Update All Margin amount")
            {
                ApplicationArea = All;
                Caption = 'Update All Margin amount';
                Image = Action;

                trigger OnAction()
                var
                    EventSub: Codeunit "EventSubscribers1";
                begin
                    EventSub.UpdateallMA();

                end;
            }
        }
    }

}