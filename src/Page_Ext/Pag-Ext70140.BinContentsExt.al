namespace ALProject.ALProject;

using Microsoft.Warehouse.Structure;
using Microsoft.Inventory.Item;

pageextension 70140 "Bin Contents Ext" extends "Bin Contents"
{
    layout
    {
        addafter("Unit of Measure Code")
        {
            field("Blocked Item"; Rec."Blocked_Item")
            {
                ApplicationArea = All;
                Caption = 'Blocked Item';
                ToolTip = 'Indicates whether the item is blocked.';
                Editable = true;
                Enabled = true;
                Visible = true;

            }
            field("HACCP Item"; Rec."HACCP Item")
            {
                ApplicationArea = All;
                Caption = 'HACCP Item';
                ToolTip = 'Indicates whether the item is marked for HACCP.';
                Editable = false;
                Enabled = true;
                Visible = true;

            }
        }
    }

    actions
    {
        addafter("Warehouse Entries")
        {
            action("Update Items Blocked")
            {
                ApplicationArea = All;
                Caption = 'Update Items Blocked';
                ToolTip = 'Update the blocked status of items based on the Bin Content.';
                Image = Item;
                trigger OnAction()
                var
                    Item: Record Item;
                begin
                    if Rec.FindSet() then
                        repeat

                            if Item.Get(Rec."Item No.") then begin
                                Rec.Blocked_Item := Item."Blocked";
                                Rec.Modify();
                            end;
                        until Rec.Next() = 0;
                end;
            }

            action("Update Items HACCP")
            {
                ApplicationArea = All;
                Caption = 'Update Items HACCP';
                ToolTip = 'Update the HACCP status of items based on the Bin Content.';
                Image = Item;
                trigger OnAction()
                var
                    Item: Record Item;
                begin
                    if Rec.FindSet() then
                        repeat

                            if Item.Get(Rec."Item No.") then begin
                                Rec."HACCP Item" := Item."HACCP Item";
                                Rec.Modify();
                            end;
                        until Rec.Next() = 0;
                end;
            }
        }
    }
}
