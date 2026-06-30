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
        addafter("Line Discount Amount")  //#246-Customer ledger Entry Field
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

        addlast(Control35)
        {
            field("Annualized Quote Figure"; Rec."Annualized Quote Figure")
            {
                ApplicationArea = All;
                Caption = 'Annualized Quote Figure';
                ToolTip = 'The Annualized Quote Figure field shows the annualized quote figure for the sales quote line.';
            }

        }
        addafter("Location Code")    // adding backorder status field in sales quote subform - Tommy
        {
            field("Backorder Status"; Rec."Backorder Status")
            {
                ApplicationArea = All;
                Caption = 'Backorder Status';
                ToolTip = 'The Backorder Status field shows the backorder status for the sales quote line.';
            }
        }


    }
}
