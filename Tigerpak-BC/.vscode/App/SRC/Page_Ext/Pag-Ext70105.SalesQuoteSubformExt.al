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
    }
}
