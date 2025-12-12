namespace TigerpakBC.TigerpakBC;
using Microsoft.Sales.Customer;

reportextension 70101 "TP Courier Label Mel Ext" extends "TP Courier Label Mel"
{
    dataset
    {
        add("Sales Invoice Header")
        {
            column("XmasTradingHours"; Customer."Xmas Trading Hours")
            {

            }

        }
        modify("Sales Invoice Header")
        {
            trigger OnAfterAfterGetRecord()
            begin

                if Customer.get("Sales Invoice Header"."Sell-to Customer No.") then begin

                    XmasTradingHours := Customer."Xmas Trading Hours";
                end;
            end;
        }

    }
    var
        XmasTradingHours: Text[100];
        Customer: Record Customer;
}
