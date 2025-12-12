namespace TigerpakBC.TigerpakBC;
using Microsoft.Sales.Customer;

reportextension 70104 "Tax - Invoice Ext" extends "Tax - Invoice"
{
    dataset
    {
        add(Header)
        {
            column("XmasTradingHours"; Customer."Xmas Trading Hours")
            {

            }

        }
        modify(Header)
        {
            trigger OnAfterAfterGetRecord()
            begin

                if Customer.get(Header."Sell-to Customer No.") then begin

                    XmasTradingHours := Customer."Xmas Trading Hours";
                end;
            end;
        }

    }
    var
        XmasTradingHours: Text[100];
        Customer: Record Customer;
}

