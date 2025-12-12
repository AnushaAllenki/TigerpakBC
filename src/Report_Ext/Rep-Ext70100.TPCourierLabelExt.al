namespace ALProject.ALProject;
using Microsoft.Sales.Customer;

reportextension 70100 "TP Courier Label Ext" extends "TP Courier Label"
{
    RDLCLayout = './Layouts/TPcourierLabel.rdl';
    dataset
    {
        add("Sales Invoice Header")
        {
            column(ReceiveTime; RecTime)
            {

            }
            column("XmasTradingHours"; Customer."Xmas Trading Hours")
            {

            }

        }
        modify("Sales Invoice Header")
        {
            trigger OnAfterAfterGetRecord()
            begin

                if Customer.get("Sales Invoice Header"."Sell-to Customer No.") then begin
                    RecTime := Customer."Receive Times";
                    XmasTradingHours := Customer."Xmas Trading Hours";
                end else
                    RecTime := 'No Receive Time';
                XmasTradingHours := 'No Xmas Trading Hours';
            end;
        }
    }
    var
        Customer: Record Customer;
        RecTime: Text[100];
        XmasTradingHours: Text[100];


}
