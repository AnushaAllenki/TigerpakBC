namespace TigerpakBC.TigerpakBC;

using Microsoft.Purchases.Document;
using Microsoft.Inventory.Item;

pageextension 70147 "Purchase Lines Ext" extends "Purchase Lines"
{
    // Added this field to expose in BC Purchase Line API
    //#259 Expose Fileds in BCpurchase line API
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

                        if Rec."No." <> '' then begin
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
