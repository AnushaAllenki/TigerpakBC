namespace ALProject.ALProject;
using Microsoft.Sales.Customer;
using Microsoft.CRM.Contact;
using Microsoft.Sales.Document;

pageextension 70130 "Master Sales Quotes Ext" extends "Master Sales Quotes"
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
    }
    actions
    {
        addafter(CreateTask)
        {
            action("Update Account Instructions")
            {
                ApplicationArea = All;
                Caption = 'Update Account Instructions';
                Image = UpdateShipment;
                trigger OnAction()
                var
                    Customer: Record Customer;
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
            action(UpdateTPCostNew)
            {
                AccessByPermission = TableData Contact = R;
                ApplicationArea = Basic, Suite;
                Caption = 'UpdateTPCostNew';

                //Enabled = ContactSelected;
                Image = UpdateUnitCost;
                ToolTip = 'Run the task to update TP unit cost and TP profit %';
                trigger OnAction()
                var
                    SalesHeader: Record "Sales Header";
                    Updated: Boolean;
                begin
                    SalesHeader := Rec;
                    CurrPage.SetSelectionFilter(SalesHeader);
                    if SalesHeader.FindFirst() then
                        repeat
                            Updated := SalesHeader.UpdateTPUnitCostNew()
                        until SalesHeader.Next() = 0;
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

