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

            column(BillToName; Header."Bill-to Name") { }

            column(BillToAddress; Header."Bill-to Address") { }
            column(BillToAddress2; Header."Bill-to Address 2") { }
            column(BillToCity; Header."Bill-to City") { }
            column(BillToPostCode; Header."Bill-to Post Code") { }
            column(BillToCountryRegionCode; Header."Bill-to Country/Region Code") { }
            column(BillToCounty; Header."Bill-to County") { }
            column(BillToContact; Header."Bill-to Contact") { }


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

