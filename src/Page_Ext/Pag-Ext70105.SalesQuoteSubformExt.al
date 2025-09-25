pageextension 70105 "Sales Quote Subform_Ext" extends "Sales Quote Subform"
{
    layout
    {
        modify("Line Discount %")
        {
            Visible = false;
            Editable = false;
            Enabled = false;
        }
        modify("Line Discount Amount")
        {
            Visible = false;
            Editable = false;
            Enabled = false;
        }
        addafter("Line Discount Amount")
        {
            field("TP Unit Cost_New"; Rec."TP Unit Cost_New")
            {
                ApplicationArea = All;
                Caption = 'TP Unit Cost_New';
                ToolTip = 'The TP Unit Cost_New field shows the new TP unit cost for the sales quote line.';
            }

            field("TP Profit%_New"; Rec."TP Profit%_New")
            {
                ApplicationArea = All;
                Caption = 'TP Profit%_New';
                ToolTip = 'The TP Profit%_New field shows the new TP profit percentage for the sales quote line.';
            }

        }
        modify("TP Unit Cost")
        {
            Visible = false;
            Enabled = false;
        }
        modify("TP Profit %")
        {
            Visible = false;
            Enabled = false;
        }
    }
}
