pageextension 70119 "Sales Quotes Ext" extends "Sales Quotes"
{
    layout
    {
        addafter("Posting Date")
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
            }
        }
    }
    actions
    {
        addafter("customer")
        {
            action("Update All Customer Grading")
            {
                ApplicationArea = All;
                Caption = 'Update All Customer Grading';
                Image = Action;

                trigger OnAction()
                var
                    EventSub: Codeunit "EventSubscribers1";
                begin
                    EventSub.UpdateAllCustomerGrading();
                end;
            }
        }

        addafter(MakeOrder)
        {
            action("Update Account Instructions")
            {
                ApplicationArea = All;
                Caption = 'Update Account Instructions';
                Image = Action;

                trigger OnAction()
                var
                    customer: Record Customer;
                begin
                    Rec.SetRange("Document Type", Rec."Document Type"::Quote);
                    Rec.SetRange("Sell-to Customer No.", customer."No.");
                    if rec."No." <> '' then
                        if Rec.FindFirst() then begin
                            repeat

                                Rec."Account Instructions" := customer."Account Instructions";
                                Rec.Modify();
                            until rec.next = 0;
                        end;

                end;
            }
        }
    }

}
