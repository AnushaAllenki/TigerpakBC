namespace TigerpakBC.TigerpakBC;

using Microsoft.Sales.Customer;
using Microsoft.Pricing.PriceList;
using Microsoft.Inventory.Ledger;
using Microsoft.Inventory.Item;
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
                DataItemTableView = SORTING(Type, "No.") where(Type = const(Item));
                column(Posting_Date2; "Posting Date") { }
                Column(Document_No_2; "Document No.") { }
                column(Item_No_2; "No.") { }
                column(Description_item2; Description) { }
                column(Quantity2; Quantity) { }
                column(UnitPrice2; "Unit Price") { }
                column(Item_Category_Group; "Item Category Group") { }
                column(Line_Amount; "Line Amount") { }
                column(Blocked_Item; Blocked_Item) { }
                column(Blocked_Days_Since; BlockedDaysSince) { }

                trigger OnAfterGetRecord()
                var
                    Count: Integer;
                    SalesInvLineRec: Record "Sales Invoice Line";
                    salesamount: Decimal;

                begin
                    IF (ItemCode = '') or (ItemCode <> SalesInvoiceLine2."No.") then begin
                        ItemCode := SalesInvoiceLine2."No.";
                        SalesInvLineRec.reset();
                        SalesInvLineRec.SetCurrentKey("Order No.", "Order Line No.", "Posting Date");
                        SalesInvLineRec.SetRange("No.", SalesInvoiceLine2."No.");
                        if SalesInvLineRec.FindLast() then begin
                            BlockedDaysSince := Today - SalesInvLineRec."Posting Date";
                            salesamount += SalesInvLineRec."Line Amount";
                            Count += 1;
                            if not (SalesInvLineRec."Posting Date" <= (Today - 90)) then
                                CurrReport.Skip();
                        end;

                    end else
                        CurrReport.Skip();

                end;
            }
            dataitem("salesinvoiceline3"; "Sales Invoice Line")
            {
                DataItemLinkReference = Customer;
                DataItemLink = "Sell-to Customer No." = field("No.");
                DataItemTableView = SORTING("Item Category Group") where(Type = const(Item));
                column(Posting_Date3; "Posting Date") { }
                Column(Document_No_3; "Document No.") { }
                column(Item_No_3; "No.") { }
                column(Description_item3; Description) { }
                column(Item_Category_Group3; "Item Category Group") { }
                column(Quantity3; Quantity) { }
                column(UnitPrice3; "Unit Price") { }
                column(TotalSalesAmount; TotalSalesAmt) { }
                trigger OnAfterGetRecord()
                var
                    salesInvRecLoc: Record "Sales Invoice Line";
                begin
                    if ItemCategoryCode = SalesInvoiceLine3."Item Category Group" then begin
                        TotalSalesAmt += "salesinvoiceline3"."Line Amount";
                        salesInvRecLoc.reset();
                        salesInvRecLoc.SetCurrentKey("Item Category Group");
                        salesInvRecLoc.CopyFilters(salesinvoiceline3);
                        salesInvRecLoc.get(salesinvoiceline3."Document No.", salesinvoiceline3."Line No.");
                        if salesInvRecLoc.find('>') then
                            if salesInvRecLoc."Item Category Group" = SalesInvoiceLine3."Item Category Group" then
                                CurrReport.Skip();
                    end else begin
                        ItemCategoryCode := SalesInvoiceLine3."Item Category Group";
                        TotalSalesAmt := "salesinvoiceline3"."Line Amount";
                        salesInvRecLoc.reset();
                        salesInvRecLoc.SetCurrentKey("Item Category Group");
                        salesInvRecLoc.CopyFilters(salesinvoiceline3);
                        salesInvRecLoc.get(salesinvoiceline3."Document No.", salesinvoiceline3."Line No.");
                        if salesInvRecLoc.find('>') then
                            if salesInvRecLoc."Item Category Group" = SalesInvoiceLine3."Item Category Group" then
                                CurrReport.Skip();
                    end;
                end;

            }

            //         dataitem(Result1; "Top10DormantItems Buffer")
            //         {
            //             UseTemporary = true;

            //             // Sort by sales amount DESC so highest appear first
            //             DataItemTableView = SORTING("Total Sales Amount") ORDER(Descending);

            //             // Optional request filter
            //             RequestFilterFields = "Item No.";

            //             column(ItemNo; "Item No.") { Caption = 'Item No.'; }
            //             column(ResultDescription; Description) { Caption = 'Description'; }
            //             column(ResultTotalSalesAmount; "Total Sales Amount")
            //             {
            //                 Caption = 'Total Sales Amount (LCY)';
            //                 AutoFormatType = 1; // standard amount formatting
            //             }
            //             column(LastSaleDate; "Last Sale Date") { Caption = 'Last Sale Date'; }
            //             column(DaysSinceLastSale; "Days Since Last Sale") { Caption = 'Days Since Last Sale'; }

            //             trigger OnPreDataItem()
            //             begin
            //                 // Build + trim the temporary dataset before iteration
            //                 BuildCandidatesAndMeasures(Result);
            //                 KeepTopN(Result);
            //             end;
            //         }

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



    // local procedure BuildCandidatesAndMeasures(var ResultRec: Record "Top10DormantItems Buffer" temporary)
    // var
    //     ItemRec: Record Item;
    //     ILE: Record "Item Ledger Entry";
    //     VE: Record "Value Entry";
    //     LastSale: Date;
    //     AgeDays: Integer;
    //     SumSales: Decimal;
    //     ItemNoFilter: Text;
    // begin
    //     // Respect any Item No. filter the user applied on the DataItem
    //     ItemNoFilter := ResultRec.GetFilter("Item No.");

    //     ItemRec.Reset();
    //     if ItemNoFilter <> '' then
    //         ItemRec.SetFilter("No.", ItemNoFilter);

    //     // Optional: add other quick constraints (uncomment as needed)
    //     // ItemRec.SetRange(Type, ItemRec.Type::Inventory);
    //     // ItemRec.SetRange(Blocked, false);

    //     if not ItemRec.FindSet() then
    //         exit;

    //     repeat
    //         // 1) Last sale date up to WorkDateParam
    //         LastSale := 0D;
    //         ILE.Reset();
    //         ILE.SetRange("Item No.", ItemRec."No.");
    //         ILE.SetRange("Entry Type", ILE."Entry Type"::Sale);
    //         ILE.SetFilter("Posting Date", '..%1', WorkDateParam);
    //         ILE.SetCurrentKey("Item No.", "Posting Date");
    //         if ILE.FindLast() then
    //             LastSale := ILE."Posting Date";

    //         // Guarded logic instead of 'continue'
    //         if LastSale <> 0D then begin
    //             AgeDays := WorkDateParam - LastSale;

    //             if AgeDays > DaysWithoutSales then begin
    //                 // 2) Sum Sales Amount (Actual) up to WorkDateParam, only for sales-linked VEs
    //                 SumSales := 0;
    //                 VE.Reset();
    //                 VE.SetCurrentKey("Item No.", "Posting Date");
    //                 VE.SetRange("Item No.", ItemRec."No.");
    //                 VE.SetFilter("Posting Date", '..%1', WorkDateParam);

    //                 if VE.FindSet() then
    //                     repeat
    //                         if IsSaleValueEntry(VE) then
    //                             SumSales += VE."Sales Amount (Actual)";
    //                     until VE.Next() = 0;

    //                 if SumSales <> 0 then begin
    //                     ResultRec.Init();
    //                     ResultRec."Item No." := ItemRec."No.";
    //                     ResultRec.Description := ItemRec.Description;
    //                     ResultRec."Total Sales Amount" := SumSales;
    //                     ResultRec."Last Sale Date" := LastSale;
    //                     ResultRec."Days Since Last Sale" := AgeDays;
    //                     ResultRec.Insert();
    //                 end;
    //             end;
    //         end;
    //     until ItemRec.Next() = 0;
    // end;

    // local procedure GetLastSaleDate(ItemNo: Code[20]): Date
    // var
    //     ILE: Record "Item Ledger Entry";
    // begin
    //     ILE.Reset();
    //     ILE.SetRange("Item No.", ItemNo);
    //     ILE.SetRange("Entry Type", ILE."Entry Type"::Sale);
    //     ILE.SetFilter("Posting Date", '..%1', WorkDateParam);
    //     ILE.SetCurrentKey("Item No.", "Posting Date");
    //     if ILE.FindLast() then
    //         exit(ILE."Posting Date");
    //     exit(0D);
    // end;

    // local procedure CalcSalesAmount(ItemNo: Code[20]; ToDate: Date): Decimal
    // var
    //     VE: Record "Value Entry";
    //     ILE: Record "Item Ledger Entry";
    //     SumSales: Decimal;
    // begin
    //     SumSales := 0;
    //     VE.Reset();
    //     VE.SetCurrentKey("Item No.", "Posting Date");
    //     VE.SetRange("Item No.", ItemNo);
    //     VE.SetFilter("Posting Date", '..%1', ToDate);

    //     if VE.FindSet() then
    //         repeat
    //             if (VE."Item Ledger Entry No." <> 0) and ILE.Get(VE."Item Ledger Entry No.") then
    //                 if ILE."Entry Type" = ILE."Entry Type"::Sale then
    //                     SumSales += VE."Sales Amount (Actual)";
    //         until VE.Next() = 0;

    //     exit(SumSales);
    // end;


    // local procedure KeepTopN(var ResultRec: Record "Top10DormantItems Buffer" temporary)
    // var
    //     Rank: Integer;
    //     Sorted: Record "Top10DormantItems Buffer" temporary;
    // begin
    //     // Copy top N rows (sorted by Total Sales Amount DESC) into a new temp and swap
    //     Sorted.DeleteAll();

    //     ResultRec.Reset();
    //     ResultRec.SetCurrentKey("Total Sales Amount");
    //     ResultRec.Ascending(false);

    //     if ResultRec.FindSet() then begin
    //         Rank := 0;
    //         repeat
    //             Rank += 1;
    //             if Rank <= TopN then begin
    //                 Sorted.Init();
    //                 Sorted.TransferFields(ResultRec);
    //                 Sorted.Insert();
    //             end;
    //         until ResultRec.Next() = 0;
    //     end;

    //     ResultRec.DeleteAll();
    //     if Sorted.FindSet() then
    //         repeat
    //             ResultRec.Init();
    //             ResultRec.TransferFields(Sorted);
    //             ResultRec.Insert();
    //         until Sorted.Next() = 0;
    // end;

    // local procedure IsSaleValueEntry(var VE: Record "Value Entry"): Boolean
    // var
    //     ILE: Record "Item Ledger Entry";
    // begin
    //     // Confirm the VE is tied to a Sale ILE
    //     if VE."Item Ledger Entry No." = 0 then
    //         exit(false);
    //     if not ILE.Get(VE."Item Ledger Entry No.") then
    //         exit(false);
    //     exit(ILE."Entry Type" = ILE."Entry Type"::Sale);
    // end;

    var
        BlockedDaysSince: Integer;
        ItemCode: Code[20];
        TotalSalesAmt: Decimal;
        ItemCategoryCode: Option " ","Adhesive & Wrapping Solutions","Primary Packaging Materials","Shipping & Protective Solutions","Industrial & Workplace Essentials";

        WorkDateParam: Date;
        DaysWithoutSales: Integer;
        TopN: Integer;

        // Working records
        ItemRec: Record Item;
        ILE: Record "Item Ledger Entry";
        VE: Record "Value Entry";
        Result: Record "Top10DormantItems Buffer" temporary;

    trigger OnInitReport()
    begin
        if WorkDateParam = 0D then
            WorkDateParam := WorkDate; // default to user Work Date
        if DaysWithoutSales = 0 then
            DaysWithoutSales := 90;     // default dormancy threshold
        if TopN = 0 then
            TopN := 10;                 // default top N
    end;

}
