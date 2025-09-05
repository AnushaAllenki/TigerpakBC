pageextension 70118 "Sales Quote Ext" extends "Sales Quote"
{
    layout
    {
        addafter("Salesperson Code")
        {
            field("Customer Grading"; Rec."Customer Grading")
            {
                ApplicationArea = All;
                ToolTip = 'Customer Grading';
                Editable = true;
            }


        }

        addafter("Sell-to Customer Name")
        {
            field("Account Instructions"; Rec."Account Instructions")
            {
                ApplicationArea = All;
                ToolTip = 'Account Instructions';
                Editable = true;
                StyleExpr = true;
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

            field("Quote Status"; Rec."Quote Status")
            {
                ApplicationArea = All;
                Caption = 'Quote Status';
                ToolTip = 'Quote Status';
                Editable = true;
                // ShowMandatory = true;
            }

        }




    }


}



