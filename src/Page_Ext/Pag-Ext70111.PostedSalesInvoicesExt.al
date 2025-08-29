pageextension 70111 PostedSalesInvoicesExt extends "Posted Sales Invoices"
{

    actions
    {
        addafter(CorrectInvoice)
        {
            action("Update ALL NPS")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Update ALL NPS';
                Ellipsis = true;
                Image = Action;

                trigger OnAction()
                var
                    EventSub: Codeunit "EventSubscribers1";
                begin
                    EventSub.UpdateAllNPS();

                end;
            }
            action("Update Email Sent")
            {

                ApplicationArea = Basic, Suite;
                Caption = 'Update Email Sent';
                Ellipsis = true;
                Image = Action;

                trigger OnAction()

                var
                    eventSub: Codeunit "EventSubscribers1";
                begin
                    eventSub.UpdatedEmailSent();

                end;

            }
        }
    }

}
