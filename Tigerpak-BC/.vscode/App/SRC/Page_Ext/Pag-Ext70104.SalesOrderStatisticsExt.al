pageextension 70104 "Sales Order Statistics_Ext" extends "Sales Order Statistics"
{
    layout
    {
        modify(InvDiscountAmount_General)
        {
            Visible = false;
        }
        modify(InvDiscountAmount_Invoicing)
        {
            Visible = false;

        }
    }
}
