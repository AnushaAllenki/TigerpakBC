namespace ALProject.ALProject;

using Microsoft.Inventory.Item;

pageextension 70120 "Item List Ext" extends "Item List"
{
    layout
    {
        addafter("Unit Price")
        {
            field("IA_Custom002"; Rec."IA_Custom002")
            {
                Caption = 'IA_Custom002';
                ApplicationArea = All;

            }
            field(Classification; Rec.Classification)
            {
                Caption = 'Classification';
                ApplicationArea = All;
            }
        }

    }
    actions
    {
        addafter(AdjustInventory)
        {
            action("Update_Stocking_Indicator")
            {
                ApplicationArea = All;
                Caption = 'Update Stocking Indicator';
                Image = Action;

                trigger OnAction()
                var
                    Item: Record "Item";
                begin
                    Item.Reset();
                    //Item.SetRange("No.", Rec."No.");
                    Item.SetRange(Classification, Rec.Classification::DISCONTINUED);
                    if Item.FindFirst() then
                        repeat
                            Item."IA_Custom002" := Rec."IA_Custom002"::"Obsolete (O)";
                            Item.Modify();
                        until Item.Next() = 0;
                end;
            }
        }
    }
}
