namespace TigerpakBC.TigerpakBC;

using Microsoft.Sales.Customer;
using Microsoft.Pricing.PriceList;
using Microsoft.Inventory.Ledger;
using Microsoft.Sales.History;

report 70101 "TP Customer Statistics "
{
    ApplicationArea = All;
    Caption = 'TP Customer Statistics ';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = TPCustomerStatistics;
    dataset
    {
        dataitem(Customer; Customer)
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.";
            column(Name; Name)
            {
            }
            column(Address; Address)
            {
            }
            column(City; City)
            {
            }
            column(County; County)
            {
            }
            column(PostCode; "Post Code")
            {
            }
            column(CountryRegionCode; "Country/Region Code")
            {
            }
            column(ContactName; ContactName)
            {
            }
            column(EMail; "E-Mail")
            {
            }
            column(PhoneNo; "Phone No.")
            {
            }
            column(MobilePhoneNo; "Mobile Phone No.")
            {
            }
            column(CustomerGrade; "Customer Grade")
            {
            }
            column(Marginamount_12months; Marginamount_12months)
            {
            }
            column(ThisQrtrSalesAmount; "This Qrtr Sales Amount")
            {
            }
            column(LastQrtrSalesAmount; "Last Qrtr Sales Amount")
            {
            }

            dataitem("Price List Line"; "Price List Line")
            {
                DataItemLinkReference = Customer;
                DataItemLink = "Source No." = field("No.");
                column(Product_No_; "Product No.")
                { }
                column(Description; Description)
                { }
                column(Unit_Price; "Unit Price")
                { }
                column(Minimum_Quantity; "Minimum Quantity")
                { }

                trigger OnAfterGetRecord()
                begin
                    //"Price List Line".SetRange("Assign-to No.", Customer."No.");

                end;


            }

            // DataItem(ItemLedgerEntry; "Item Ledger Entry")
            // {
            //     DataItemLinkReference = Customer;
            //     DataItemLink = "Source No." = field("No.");

            //     DataItemTableView = SORTING("Posting Date") ORDER(Descending);

            //     column(Posting_Date; "Posting Date") { }
            //     Column(Document_No_; "Document No.") { }
            //     column(Item_No_; "Item No.") { }
            //     column(Description_item; Description) { }
            //     column(Quantity; Quantity) { }
            //     trigger OnPreDataItem()
            //     begin
            //         // Apply filters before fetching

            //         ItemLedgerEntry.SetRange("Entry Type", ItemLedgerEntry."Entry Type"::Sale);
            //         ItemLedgerEntry.SetRange("Source Type", ItemLedgerEntry."Source Type"::Customer);
            //         ItemLedgerEntry.SetRange("Source No.", Customer."No.");
            //     end;

            //     trigger OnAfterGetRecord()
            //     var
            //         Count: Integer;
            //     begin
            //         Count += 1;
            //         if (Count >= 20) then
            //             CurrReport.Break;
            //     end;
            // }
            DataItem(SalesInvLines; "Sales Invoice Line")
            {
                DataItemLinkReference = Customer;
                DataItemLink = "Sell-to Customer No." = field("No.");

                DataItemTableView = SORTING("Posting Date") ORDER(Descending);

                column(Posting_Date; "Posting Date") { }
                Column(Document_No_; "Document No.") { }
                column(Item_No_; "No.") { }
                column(Description_item; Description) { }
                column(Quantity; Quantity) { }
                column(UnitPrice; "Unit Price") { }
                trigger OnPreDataItem()
                begin
                    // Apply filters before fetching

                    // SalesInvLines.SetRange("Entry Type", SalesInvLines."Entry Type"::Sale);
                    SalesInvLines.SetRange("Type", SalesInvLines.Type::Item);
                    SalesInvLines.SetRange("Sell-to Customer No.", Customer."No.");
                end;

                trigger OnAfterGetRecord()
                var
                    Count: Integer;
                begin
                    Count += 1;
                    if (Count >= 20) then
                        CurrReport.Break;
                end;
            }
            dataitem("SalesInvoiceLine2"; "Sales Invoice Line")
            {
                DataItemLinkReference = Customer;
                DataItemLink = "Sell-to Customer No." = field("No.");
                DataItemTableView = SORTING("Posting Date") ORDER(Descending);
                column(Posting_Date2; "Posting Date") { }
                Column(Document_No_2; "Document No.") { }
                column(Item_No_2; "No.") { }
                column(Description_item2; Description) { }
                column(Quantity2; Quantity) { }
                column(UnitPrice2; "Unit Price") { }
                column(Item_Category_Group; "Item Category Group") { }
                column(Line_Amount; "Line Amount") { }
                trigger OnPreDataItem()
                begin
                    "SalesInvoiceLine2".SetRange("Sell-to Customer No.", Customer."No.");
                end;

            }
        }
    }

    rendering
    {
        layout(TPCustomerStatistics)
        {
            LayoutFile = './src/Layouts/Customer.docx';
            Type = Word;
        }
    }

}
