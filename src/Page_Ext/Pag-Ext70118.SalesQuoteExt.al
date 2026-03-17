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
                ShowMandatory = rec."quote type" = rec."Quote Type"::" ";
            }
            field(Quote_Type_Text; Rec.Quote_Type_Text)
            {
                ApplicationArea = All;
                Caption = 'Quote Type Text';
                ToolTip = 'Quote Type Text';
                Editable = false;
                ShowMandatory = true;
            }

            field("Quote Outcome"; Rec."Quote Status")
            {
                ApplicationArea = All;
                Caption = 'Quote Outcome';
                ToolTip = 'Quote Outcome';
                Editable = true;

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
    // trigger OnClosePage()
    // begin
    //     if rec."Quote Type" = rec."Quote Type":: " " then begin
    //         if not Confirm('Warning:Quote Type is blank. Do you want to continue?') then
    //             CurrPage.Close();


    // end;



}



