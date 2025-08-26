namespace ALProject.ALProject;
using Microsoft.Sales.Customer;

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
        }
    }
}
