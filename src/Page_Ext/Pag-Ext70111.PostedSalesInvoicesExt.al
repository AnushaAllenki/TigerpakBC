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
                    SalesInvHeader: Record "Sales Invoice Header";

                begin
                    SalesInvHeader.Reset();
                    //SalesInvHeader.SetRange("Document Type", SalesInvHeader."Document Type"::Invoice);  
                    SalesInvHeader.SetRange("WTPL Email Sent", false);
                    if SalesInvHeader.FindFirst() then
                        repeat
                            SalesInvHeader."WTPL Email Sent" := true;
                            SalesInvHeader.Modify();
                        until SalesInvHeader.Next() = 0;
                end;

            }
        }
    }

}
