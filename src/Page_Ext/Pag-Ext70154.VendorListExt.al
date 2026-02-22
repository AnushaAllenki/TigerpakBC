namespace TigerpakBC.TigerpakBC;

using Microsoft.Purchases.Vendor;
using Microsoft.Inventory.Item;

pageextension 70154 "Vendor List Ext" extends "Vendor List"
{
    layout
    {
        addafter(Contact)
        {
            field("Item Category Group"; Rec."Item Category Group")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        addafter(PayVendor)
        {
            action("Update Item Category Group")
            {
                Caption = 'Update Item Category Group';
                ApplicationArea = All;
                Image = Action;



                trigger OnAction()
                var
                    item: Record Item;
                begin

                    repeat
                        item.SetRange("Vendor No.", Rec."No.");
                        if item.FindSet() then begin

                            Rec."Item Category Group" := item."Item Category Group";
                            Rec.Modify();
                        end;
                    until Rec.Next() = 0;
                end;
            }

        }

    }
}
