namespace TigerpakBC.TigerpakBC;

using Microsoft.Sales.Customer;
using Microsoft.Pricing.PriceList;
using Microsoft.Inventory.Ledger;

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
                DataItemLink = "Assign-to No." = field("No.");
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
                    "Price List Line".SetRange("Assign-to No.", Customer."No.");

                end;
    

            }
            

            DataItem(ItemLedgerEntry; "Item Ledger Entry")
            {
                DataItemLink = "Source No." = field("No.");

                DataItemTableView = SORTING("Posting Date") ORDER(Descending);
                RequestFilterFields = "Source No.";
                column(Posting_Date; "Posting Date") { }
                Column(Document_No_; "Document No.") { }
                column(Item_No_; "Item No.") { }
                column(Description_item; Description) { }
                column(Quantity; Quantity) { }



                trigger OnPreDataItem()
                begin
                    // Apply filters before fetching
                    SetRange("Entry Type", "Entry Type"::Sale);
                end;

                trigger OnAfterGetRecord()
                var
                    count: Integer;
                begin
                    ItemLedgerEntry.Reset();
                    ItemLedgerEntry.SetRange("Entry Type", ItemLedgerEntry."Entry Type"::Sale);
                    ItemLedgerEntry.SetRange("Source Type", ItemLedgerEntry."Source Type"::Customer);
                    ItemLedgerEntry.SetRange("Source No.", Customer."No.");

                    ItemLedgerEntry.SetCurrentKey("Posting Date");
                    if ItemLedgerEntry.FindSet() then begin
                        count := 0;
                        repeat
                            count += 1;
                        until (ItemLedgerEntry.Next() = 0) or (Count >= 20);
                    end;
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
