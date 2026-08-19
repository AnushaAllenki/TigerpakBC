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
            column(BillToAddress; Header."Bill-to Address")
            {
            }
            column(Bill_to_Address_2; Header."Bill-to Address 2")
            {
            }
            column(Bill_to_City; Header."Bill-to City")
            {
            }
            column(Bill_to_Post_Code; Header."Bill-to Post Code")
            {
            }
            column(Bill_to_County; Header."Bill-to County")
            {
            }
            column(Bill_to_Country_Region_Code; Header."Bill-to Country/Region Code")
            {
            }
            column(Bill_to_Contact; Header."Bill-to Contact")
            {
            }
            column(BillToName; Header."Bill-to Name")
            {
            }
            column(BillToName2; Header."Bill-to Name 2")
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

