pageextension 70106 "Sales Statistics_Ext" extends "Sales Statistics"
{
    layout
    {
        modify(InvDiscountAmount)
        {
            Visible = false;
            Editable = false;
            Enabled = false;

        }
    }
}
