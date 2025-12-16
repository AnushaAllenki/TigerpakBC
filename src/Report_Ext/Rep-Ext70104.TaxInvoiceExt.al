namespace TigerpakBC.TigerpakBC;
using Microsoft.Sales.Customer;

reportextension 70104 "Tax - Invoice Ext" extends "Tax - Invoice"
{
    dataset
    {
        add(Header)
        {
            column(XmasTradingHours; XmasTradingHours)
            {

            }

        }
        modify(Header)
        {
            trigger OnAfterAfterGetRecord()
            begin

                if Customer.get(Header."Sell-to Customer No.") then begin
                    if Customer."Xmas Trading Hours" <> '' then
                        XmasTradingHours := 'Xmas Trading Hours: ' + Customer."Xmas Trading Hours"
                    else
                        XmasTradingHours := '';
                end;
            end;
        }

    }
    rendering
    {
        layout(XmasTrading)
        {
            Type = RDLC;
            LayoutFile = './Layouts/XMasTaxInvoice.rdl';
        }
    }
    var
        XmasTradingHours: Text[100];
        Customer: Record Customer;
}

