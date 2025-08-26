namespace ALProject.ALProject;

using Microsoft.Finance.GeneralLedger.Setup;

pageextension 70126 "Gen. Product Posting GroupsExt" extends "Gen. Product Posting Groups"
{
    layout
    {
        addafter("Def. VAT Prod. Posting Group")
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
    }
}
