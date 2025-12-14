namespace TigerpakBC.TigerpakBC;
using Microsoft.Sales.Customer;

reportextension 70103 "DirectConsignmentLabel Ext" extends DirectConsignmentLabel
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
    rendering
    {
        layout("XmasTax")
        {
            Type = RDLC;
            LayoutFile = './Layouts/XMasTaxInvoice.rdl';

        }
    }
    var
        XmasTradingHours: Text[100];
        Customer: Record Customer;

}


