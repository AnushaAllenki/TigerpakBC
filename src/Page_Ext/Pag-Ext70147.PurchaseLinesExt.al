namespace TigerpakBC.TigerpakBC;

using Microsoft.Purchases.Document;
using Microsoft.Inventory.Item;

pageextension 70147 "Purchase Lines Ext" extends "Purchase Lines"
{
    layout
    {
        addafter("Item Category Code")
        {
            field("Item Category Group"; Rec."Item Category Group")
            {
                ApplicationArea = All;
                Visible = false;
            }

        }
    }

    actions
    {
        addafter("Reservation Entries")
        {
            action("Update Item Category Group")
            {
                ApplicationArea = All;
                Caption = 'Update Item Category Group';
                Image = Action;

                trigger OnAction()
                var
                    item: Record Item;
                begin
                    repeat

                        if Rec."No." <> '' then
                            if Rec.Type = Rec.Type::Item then begin
                                item.Get(Rec."No.");
                                Rec."Item Category Group" := item."Item Category Group";
                                Rec.Modify();
                            end;
                    until Rec.Next() = 0;
                end;
            }
        }
    }

}
