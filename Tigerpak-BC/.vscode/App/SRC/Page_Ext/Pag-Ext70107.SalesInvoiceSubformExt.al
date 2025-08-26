pageextension 70107 "Sales Invoice Subform_Ext" extends "Sales Invoice Subform"
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

    }
}
