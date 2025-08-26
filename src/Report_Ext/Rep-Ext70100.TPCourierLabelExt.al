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

        }
        modify("Sales Invoice Header")
        {
            trigger OnAfterAfterGetRecord()
            begin

                if Customer.get("Sales Invoice Header"."Sell-to Customer No.") then begin
                    RecTime := Customer."Receive Times";
                end else
                    RecTime := 'No Receive Time';
            end;
        }
    }
    var
        Customer: Record Customer;
        RecTime: Text[100];


}
