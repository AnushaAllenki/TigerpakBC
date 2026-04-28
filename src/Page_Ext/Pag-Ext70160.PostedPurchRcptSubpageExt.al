namespace TigerpakBC.TigerpakBC;

using Microsoft.Purchases.History;

pageextension 70160 "Posted Purch Rcpt. Subpage Ext" extends "Posted Purchase Rcpt. Subform"
{
    actions
    {
        addlast(Processing)
        {
            action("Update Order Line No")
            {
                ApplicationArea = All;
                Caption = 'Update Order Line No';
                Image = History;
                Visible = true;
                trigger OnAction()
                var
                    eventHandler: Codeunit EventSubscribers1;
                begin
                    eventHandler.UpdateOrderlineNo(Rec."Document No.", Rec."Line No.");
                end;
            }
        }
    }
}
