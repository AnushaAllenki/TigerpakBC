namespace TigerpakBC.TigerpakBC;

reportextension 70101 "Order New Ext" extends "Order New"
{
    dataset
    {
        add("Purchase Header")
        {
            column(Delivery_Date; "Delivery Date")
            {
                Caption = 'Delivery Date';
            }
        }
    }
}
