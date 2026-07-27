namespace TigerpakBC.TigerpakBC;

reportextension 70105 "Order New Ext" extends "Order New"
{
    dataset
    {
        add("Purchase Header")
        {
            column(Delivery_Date; "Delivery Date")
            {
                Caption = 'Delivery Date';
            }
            column(Receiving_Address; "Receiving Address")
            {
                Caption = 'Receiving Address';
            }
            column(Receiving_Address2; "Receiving Address2")
            {
                Caption = 'Receiving Address2';

            }
            column(Receiving_City; "Receiving City")
            {
                Caption = 'Receiving City';
            }
            column(Receiving_Post_Code; "Receiving Post Code")
            {
                Caption = 'Receiving Post Code';
            }
            column(Receiving_County; "Receiving County")
            {
                Caption = 'Receiving State';
            }
            column(Receiving_Country_Region_Code; "Receiving Country/Region Code")
            {
                Caption = 'Receiving Country/Region Code';
            }
            column(Receiving_Phone_No; "ReceivingPhone No.")
            {
                Caption = 'Receiving Phone No.';
            }

        }

    }
}
