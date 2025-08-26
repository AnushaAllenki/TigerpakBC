namespace ALProject.ALProject;

using Microsoft.Inventory.Item;

pageextension 70134 "Item Templ. Card Ext" extends "Item Templ. Card"
{
    layout
    {
        addafter("Item Category Code")
        {
            field("Item Category Group"; Rec."Item Category Group")
            {
                ApplicationArea = All;
                Caption = 'Item Category Group';
                ToolTip = 'Item Category Group';
                Editable = true;
                Enabled = true;
                Visible = true;



            }
        }

        addbefore("VAT Prod. Posting Group")
        {
            field("Gen. Prod. Posting Group New"; Rec."Gen. Prod. Posting Group new")
            {
                ApplicationArea = All;
                Caption = 'Gen. Prod. Posting Group';
                ToolTip = 'Gen. Prod. Posting Group New';
                Editable = true;
                Enabled = true;
                Visible = true;
            }

        }

        modify("Gen. Prod. Posting Group")
        {
            Visible = false;

        }
    }
}
