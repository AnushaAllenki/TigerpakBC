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
        add(RoundLoop)
        {
            column(Delivery_Date_Line; "Purchase Line"."TP_Delivery Date")
            {
                Caption = 'Delivery Date Line';
            }
        }
    }
}
