codeunit 70100 "EventSubscribers1"
{
    Permissions = tabledata 110 = RMID, tabledata 112 = RIMD, tabledata 114 = rmid, tabledata 21 = rmid, tabledata 113 = rmid, tabledata 5772 = rmid;




    [EventSubscriber(ObjectType::Page, Page::"Posted Sales Inv. - Update", OnAfterRecordChanged, '', false, false)]
    local procedure OnAfterRecordChanged(var SalesInvoiceHeader: Record "Sales Invoice Header"; xSalesInvoiceHeader: Record "Sales Invoice Header"; var IsChanged: Boolean)
    begin

        IsChanged := (SalesInvoiceHeader."Payment Terms Code" <> xSalesInvoiceHeader."Payment Terms Code") or (SalesInvoiceHeader."External Document No." <> xSalesInvoiceHeader."External Document No.") or (SalesInvoiceHeader."due date" <> xSalesInvoiceHeader."Due Date") or
       (SalesInvoiceHeader."Posting Description" <> xSalesInvoiceHeader."Posting Description") or (SalesInvoiceHeader."Promised Pay Date" <> xSalesInvoiceHeader."Promised Pay Date") or
       (SalesInvoiceHeader."Dispute Status" <> xSalesInvoiceHeader."Dispute Status") or (SalesInvoiceHeader."Payment Method Code" <> xSalesInvoiceHeader."Payment Method Code") or
       (SalesInvoiceHeader."Payment Reference" <> xSalesInvoiceHeader."Payment Reference") or (SalesInvoiceHeader."Company Bank Account Code" <> xSalesInvoiceHeader."Company Bank Account Code");
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales Inv. Header - Edit", OnRunOnBeforeAssignValues, '', false, false)]
    local procedure OnRunOnBeforeAssignValues(var SalesInvoiceHeader: Record "Sales Invoice Header"; SalesInvoiceHeaderRec: Record "Sales Invoice Header")
    begin

        SalesInvoiceHeader."Payment Terms Code" := SalesInvoiceHeaderRec."Payment Terms Code";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Activity-Register", OnAfterRegisteredWhseActivHeaderInsert, '', false, false)]
    // local procedure OnAfterRegisterWhseActivity(WarehouseActivityHeader: Record "Warehouse Activity Header")
    // var
    //     // WarehousActivityHdr2: Record "Warehouse Activity Header";
    //     WarehouseActivityLine: Record "Warehouse Activity Line";
    //     registeredWhseActivityHdr2: Record "Registered Whse. Activity hdr.";
    //     registedWhseActivityLine2: Record "Registered Whse. Activity Line";
    // begin
    //     registedWhseActivityLine2.Reset();
    //     registedWhseActivityLine2.SetRange("No.", registeredWhseActivityHdr2."No.");
    //     if registedWhseActivityLine2.Findfirst() then begin
    //         registeredWhseActivityHdr2.Reset();
    //         //registeredWhseActivityHdr2.SetRange((Type, registeredWhseActivityHdr2.Type::);
    //         registeredWhseActivityHdr2.setrange(RegisteredWhseActivityHdr2."No.", registedWhseActivityLine2."No.");
    //         if registeredWhseActivityHdr2.Findfirst() then begin
    //             registeredWhseActivityHdr2."Source No." := registedWhseActivityLine2."Source No.";
    //             registeredWhseActivityHdr2.Modify();
    //         end;
    //     end;
    // end;

    local procedure OnAfterRegisteredWhseActivHeaderInsert(var RegisteredWhseActivityHdr: Record "Registered Whse. Activity Hdr."; WarehouseActivityHeader: Record "Warehouse Activity Header")

    var
        // WarehousActivityHdr2: Record "Warehouse Activity Header";
        WarehouseActivityLine: Record "Warehouse Activity Line";
        registeredWhseActivityHdr2: Record "Registered Whse. Activity hdr.";
        registedWhseActivityLine2: Record "Registered Whse. Activity Line";
    begin
        if WarehouseActivityHeader.Type = WarehouseActivityHeader.Type::Pick then begin // Only to update for Pick type

            RegisteredWhseActivityHdr."Pick Completed Date time" := CurrentDateTime(); // To capture the pick completed date time
            RegisteredWhseActivityHdr."Pick Duration" := RegisteredWhseActivityHdr."Pick Completed Date time" - RegisteredWhseActivityHdr."Pick Created Date time";
            registeredWhseActivityHdr.Modify();
        end;
        //RegisteredWhseActivityHdr2."Pick Duration" := RegisteredWhseActivityHdr2."Pick Completed Date time" - RegisteredWhseActivityHdr2."Pick Created Date time";

        registedWhseActivityLine2.Reset();
        registedWhseActivityLine2.SetRange("No.", registeredWhseActivityHdr2."No.");
        if registedWhseActivityLine2.Findfirst() then begin
            registeredWhseActivityHdr2.Reset();
            registeredWhseActivityHdr2.setrange(RegisteredWhseActivityHdr2."No.", registedWhseActivityLine2."No.");
            if registeredWhseActivityHdr2.Findfirst() then begin
                registeredWhseActivityHdr2."Source No." := registedWhseActivityLine2."Source No.";

                registeredWhseActivityHdr2.Modify();

            end;
        end;

    end;

    procedure UpdateAllSN()
    var
        RWAH: Record "Registered Whse. Activity Hdr.";
        RWAL: Record "Registered Whse. Activity Line";
        window: Dialog;
    begin
        window.Open('Updating Source No.#1 in Registered Whse. Activity Hdr.');

        RWAH.Reset();
        RWAH.SetRange("Source No.", '');
        if RWAH.FindSet() then
            repeat
                window.Update(1, RWAH."No.");
                RWAL.SetRange("No.", RWAH."No.");
                if RWAL.FindFirst() then begin
                    RWAH."Source No." := RWAL."Source No.";
                    RWAH.Modify();
                end;
            until RWAH.Next() = 0;
        window.Close();
    end;


    [EventSubscriber(ObjectType::Table, Database::"Transfer Header", OnValidateReceiptDateOnBeforeCalcShipmentDate, '', false, false)]

    local procedure OnValidateReceiptDateOnBeforeCalcShipmentDate(var IsHandled: Boolean; var TransferHeader: Record "Transfer Header")
    begin

        IsHandled := true;


    end;

    [EventSubscriber(ObjectType::Table, Database::"Transfer Header", OnValidateShipmentDateOnBeforeCalcReceiptDate, '', false, false)]
    local procedure OnValidateShipmentDateOnBeforeCalcReceiptDate(var IsHandled: Boolean; var TransferHeader: Record "Transfer Header")
    begin
        IsHandled := true;
    end;



    procedure UpdateAllNPS()
    var
        SIH: Record "Sales Invoice Header";
    begin
        SIH.Reset();
        // SIH.SetRange("No.", 'SINV-025745', 'SINV-025759');
        if SIH.Findset() then
            SIH.ModifyAll("WT Sent to NPS", true);
        // repeat
        //     SIH."WT Sent to NPS" := false;
        //     SIH.Modify();
        // until SIH.Next() = 0;
    end;

    procedure Updateprinted(DocumentNo: Code[20])
    var
        SSH: Record "Sales Shipment Header";
    begin
        if SSH.Get(DocumentNo) then begin
            SSH."No. Printed" += 1;
            SSH.Modify();
        end;

    end;

    procedure UpdateAllPrintedINV(DocumentNo: Code[20])
    var
        SIH: Record "Sales Invoice Header";
    begin
        if SIH.Get(DocumentNo) then begin
            SIH."No. Printed" += 1;
            SIH.Modify();
        end;

    end;






    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnBeforeModifyEvent, '', false, false)]
    local procedure MyProcedure(var Rec: Record "Sales Header"; var xRec: Record "Sales Header"; RunTrigger: Boolean)
    var
        Users: Record User;
    begin
        if Users.get(Rec.SystemModifiedBy) then begin
            Rec."Modified By" := Users."User Name";
        end;
    end;



    [EventSubscriber(ObjectType::Codeunit, codeunit::"Sales-Post", OnAfterFinalizePosting, '', true, true)]
    local procedure OnAfterFinalizePosting(var SalesHeader: Record "Sales Header"; var SalesShipmentHeader: Record "Sales Shipment Header"; var SalesInvoiceHeader: Record "Sales Invoice Header"; var SalesCrMemoHeader: Record "Sales Cr.Memo Header"; var ReturnReceiptHeader: Record "Return Receipt Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; CommitIsSuppressed: Boolean; PreviewMode: Boolean)
    var
        SalesCrMemoHeader2: Record "Sales Cr.Memo Header";
        SalesCrMemoLine2: Record "Sales Cr.Memo Line";
        salesinvoiceheader2: Record "Sales Invoice Header";
        SalesInvoiceline2: Record "Sales Invoice Line";
        salesHeader2: Record "Sales Header";
    begin
        if SalesCrMemoHeader2.Get(SalesCrMemoHeader."No.") then begin
            SalesCrMemoLine2.SetRange("Document No.", SalesCrMemoHeader."No.");
            if SalesCrMemoLine2.FindSet() then
                repeat
                    SalesCrMemoHeader2."Total Cost" += SalesCrMemoLine2."Unit Cost (LCY)" * SalesCrMemoLine2."Quantity";
                until SalesCrMemoLine2.Next() = 0;
            SalesCrMemoHeader2.CalcFields(Amount);


            SalesCrMemoHeader2."Margin Amount" := SalesCrMemoHeader2.Amount - SalesCrMemoHeader2."Total Cost";
            SalesCrMemoHeader2."Margin %" := (SalesCrMemoHeader2."Margin Amount" / SalesCrMemoHeader2.Amount) * 100;
            SalesCrMemoHeader2.Modify();


        end;


        if SalesInvoiceHeader2.get(salesinvoiceheader."No.") then begin
            SalesInvoiceline2.SetRange("Document No.", SalesInvoiceHeader2."No.");
            SalesInvoiceline2.SetFilter(Quantity, '<>0');
            if salesinvoiceline2.FindSet() then
                repeat
                    salesinvoiceheader2."Total Cost_New" += SalesInvoiceline2."TP Unit Cost_New" * SalesInvoiceline2.Quantity;
                until SalesInvoiceline2.Next() = 0;
            SalesInvoiceHeader2.CalcFields(Amount, "Amount Including VAT");
            salesinvoiceheader2."Margin Amount_New" := salesinvoiceheader2."Amount" - salesinvoiceheader2."Total Cost_New";
            if salesinvoiceheader2."Amount" <> 0 then
                salesinvoiceheader2."Margin %_New" := (salesinvoiceheader2."Margin Amount_New" / salesinvoiceheader2."Amount") * 100;

            // salesinvoiceheader2."Margin Amount_New" := salesinvoiceheader2.Amount - salesinvoiceheader2."Total Cost_New";
            // salesinvoiceheader2."Margin %_New" := (salesinvoiceheader2."Margin Amount_New" / salesinvoiceheader2.Amount) * 100;
            salesinvoiceheader2.Modify();
        end;
    end;

    // local procedure OnAfterReturnRcptHeaderInsert(var ReturnReceiptHeader: Record "Return Receipt Header"; SalesHeader: Record "Sales Header"; SuppressCommit: Boolean; WhseShip: Boolean; WhseReceive: Boolean; var TempWhseShptHeader: Record "Warehouse Shipment Header"; var TempWhseRcptHeader: Record "Warehouse Receipt Header")
    // begin

    // end;

    [EventSubscriber(ObjectType::Codeunit, codeunit::"Sales-Post", OnAfterSalesCrMemoHeaderInsert, '', true, true)]
    local procedure OnAfterSalesCrMemoHeaderInsert(var SalesCrMemoHeader: Record "Sales Cr.Memo Header"; SalesHeader: Record "Sales Header"; CommitIsSuppressed: Boolean; WhseShip: Boolean; WhseReceive: Boolean; var TempWhseShptHeader: Record "Warehouse Shipment Header"; var TempWhseRcptHeader: Record "Warehouse Receipt Header")
    begin
        SalesCrMemoHeader.SetRange("Pre-Assigned No.", SalesHeader."No.");
        if SalesCrMemoHeader.findfirst() then begin
            if SalesCrMemoHeader."Auto Email - Post" then begin
                SalesCrMemoHeader.SetRecFilter();
                salesCrMemoHeader.EmailRecords(false);
            end;
        end;


    end;










    [EventSubscriber(ObjectType::Codeunit, codeunit::"Sales-Post", OnAfterPostSalesLines, '', true, true)]

    procedure OnAfterPostSalesLines(var SalesHeader: Record "Sales Header"; var SalesShipmentHeader: Record "Sales Shipment Header"; var SalesInvoiceHeader: Record "Sales Invoice Header"; var SalesCrMemoHeader: Record "Sales Cr.Memo Header"; var ReturnReceiptHeader: Record "Return Receipt Header"; WhseShip: Boolean; WhseReceive: Boolean; var SalesLinesProcessed: Boolean; CommitIsSuppressed: Boolean; EverythingInvoiced: Boolean; var TempSalesLineGlobal: Record "Sales Line" temporary)

    var
        salesinvline: Record "Sales Invoice Line";


    begin
        salesinvline.SetRange("Document No.", TempSalesLineGlobal."Document No.");
        Salesinvline.SetRange("No.", TempSalesLineGlobal."No.");
        Salesinvline.SetRange("Location Code", TempSalesLineGlobal."Location Code");
        if salesinvline.FindSet() then
            repeat
                salesinvline."TP Unit Cost_New" := TempSalesLineGlobal."TP Unit Cost_New";
                salesinvline.Modify();
            until salesinvline.Next() = 0;
    end;

    procedure UpdateAllTPUnitCostNew()
    var
        SKU: Record "Stockkeeping Unit";
        //SalesLine: Record "Sales Line";
        Salesinvline: Record "Sales Invoice Line";
    begin
        SKU.Reset();
        //Salesinvline.SetRange("No.", ;
        //Salesinvline.SetRange("Location Code", sku."Location Code");
        salesinvline.setrange(type, salesinvline.type::Item);
        if SalesinvLine.FindSet() then
            repeat
                SKU.Reset();
                SKU.SetRange("Item No.", SalesinvLine."No.");
                SKU.SetRange("Location Code", SalesinvLine."Location Code");
                if SKU.FindFirst() then
                    SalesinvLine."TP Unit Cost_New" := SKU."TP Unit Cost_New"
                else
                    SalesinvLine."TP Unit Cost_New" := 0;
                //SalesinvLine."TP Unit Cost_New" := SKU."TP Unit Cost_New";
                SalesinvLine.Modify();
            until SalesinvLine.Next() = 0;

    end;



    [EventSubscriber(ObjectType::Codeunit, codeunit::"WMS Management", OnInitWhseJnlLineCopyFromItemJnlLine, '', true, true)]
    procedure OnInitWhseJnlLineCopyFromItemJnlLine(var WarehouseJournalLine: Record "Warehouse Journal Line"; ItemJournalLine: Record "Item Journal Line")
    begin
        WarehouseJournalLine.Narrative := ItemJournalLine.Narrative;
    end;

    [EventSubscriber(ObjectType::Codeunit, codeunit::"Whse. Jnl.-Register Line", OnInitWhseEntryCopyFromWhseJnlLine, '', true, true)]
    procedure OnInitWhseEntryCopyFromWhseJnlLine(var WarehouseEntry: Record "Warehouse Entry"; var WarehouseJournalLine: Record "Warehouse Journal Line"; OnMovement: Boolean; Sign: Integer; Location: Record Location; BinCode: Code[20]; var IsHandled: Boolean)
    begin
        WarehouseEntry.Narrative := WarehouseJournalLine.Narrative;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", OnBeforePostItemJnlLine, '', true, true)]
    local procedure OnBeforePostItemJnlLine(var ItemJournalLine: Record "Item Journal Line")
    var
        Texttrim: text;
    begin
        if (ItemJournalLine."Source Code" = 'RECLASSJNL') and (ItemJournalLine."Journal Template Name" = 'TRANSFER') and
        ((ItemJournalLine."Entry Type" = ItemJournalLine."Entry Type"::Transfer)) then begin

            Texttrim := ItemJournalLine.Narrative;
            ItemJournalLine.TestField(Narrative);
            if StrLen(Texttrim.trim) <> StrLen(ItemJournalLine.Narrative) then
                Error(('Narratives cannot end with empty spaces'));
            if StrLen(Texttrim.trim) < 5 then
                Error('Mandatory Narrative must be completed for Item Journal');
        end;

    end;

    procedure UpdateallMA()

    var
        SCM: Record "Sales Cr.Memo Header";
        SCL: Record "Sales Cr.Memo Line";
        TotalCost: Decimal;
    begin
        SCM.SetRange("Margin Amount", 0);
        if SCM.Findfirst() then
            repeat
                Clear(TotalCost);
                SCL.SetRange("Document No.", SCM."No.");
                if SCL.Findfirst() then
                    repeat
                        TotalCost += SCL."Unit Cost (LCY)" * SCL."Quantity";
                    until SCL.Next() = 0;

                SCM.CalcFields(Amount);
                SCM."Margin Amount" := SCM.Amount - TotalCost;
                SCM."W Margin Amount" := SCM."Margin Amount";
                SCM."Total Cost" := TotalCost;
                SCM."W Total Cost" := SCM."Total Cost";

                if SCM.Amount <> 0 then
                    SCM."Margin %" := (SCM."Margin Amount" / SCM.Amount) * 100;
                scm."W Margin %" := scm."Margin %";
                SCM.Modify();
            until SCM.Next() = 0;

    end;

    procedure UpdateAllIMA();
    var
        SIH: Record "Sales Invoice Header";
        SIL: Record "Sales Invoice Line";
        TotalCost: Decimal;
    begin
        SIH.SetRange("Margin Amount_New", 0);
        if SIH.Findfirst() then
            repeat
                Clear(TotalCost);
                SIL.SetRange("Document No.", SIH."No.");
                if SIL.Findfirst() then
                    repeat
                        TotalCost += SIL."TP Unit Cost_New" * SIL.Quantity;
                    until SIL.Next() = 0;

                SIH.CalcFields(Amount, "Amount");
                SIH."Margin Amount_New" := SIH."Amount" - TotalCost;
                SIH."Total Cost_New" := TotalCost;
                if SIH."Amount" <> 0 then
                    SIH."Margin %_New" := (SIH."Margin Amount_New" / SIH."Amount") * 100;
                SIH.Modify();
            until SIH.Next() = 0;

    end;

    procedure UpdateAllCLEMA();
    var
        CLE: Record "Cust. Ledger Entry";
        SCH: Record "Sales Cr.Memo Header";
    begin
        CLE.Reset();
        cle.SetRange("Document Type", cle."Document Type"::"Credit Memo");
        CLE.SetRange("TP Cr Margin Amount", 0);
        if CLE.Findfirst() then
            repeat
                if SCH.GET(CLE."Document No.") then begin
                    CLE."TP Cr Margin Amount" := SCH."Margin Amount";
                    CLE.MODIFY();
                end;
            until CLE.NEXT() = 0;
    end;


    procedure UpdateAllCLEIMA_New();
    var


        CLE: Record "Cust. Ledger Entry";
        SIH: Record "Sales Invoice Header";
    begin
        CLE.Reset();
        CLE.SetRange("Document Type", CLE."Document Type"::Invoice);
        CLE.SetRange("Inv Margin Amount_New", 0);
        if CLE.FindFirst() then
            repeat
                if SIH.GET(CLE."Document No.") then begin
                    CLE."Inv Margin Amount_New" := SIH."Margin Amount_New";
                    CLE.MODIFY();
                end;
            until CLE.NEXT() = 0;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnValidateSellToCustomerNoOnBeforeRecallModifyAddressNotification, '', false, false)]
    local procedure OnValidateSellToCustomerNoOnBeforeRecallModifyAddressNotification(var SalesHeader: Record "Sales Header"; xSalesHeader: Record "Sales Header")

    var

        Customer: Record Customer;
    begin
        if SalesHeader."Document Type" = SalesHeader."Document Type"::Quote then
            if Customer.GET(SalesHeader."Sell-to Customer No.") then begin

                SalesHeader."Customer Grading" := Customer."Customer Grade";
                //SalesHeader.MODIFY;

            end;
    end;


    procedure UpdateAllCustomerGrading()
    var
        SH: Record "Sales Header";

        Cust: Record Customer;
    begin
        SH.Reset();

        SH.SetRange("Customer Grading", '');
        SH.setrange(SH."Document Type", SH."Document Type"::Quote);
        if SH.Findfirst() then
            repeat
                if Cust.Get(SH."Sell-to Customer No.") then begin
                    SH."Customer Grading" := Cust."Customer Grade";
                    SH.Modify();
                end;
            until SH.Next() = 0;

    end;

    [EventSubscriber(ObjectType::Page, Page::"Item Avail. by Location Lines", OnAfterSetItemFilter, '', false, false)]
    procedure OnAfterSetItemFilter(var Item: Record Item; var PeriodStart: Date; var PeriodEnd: Date);
    begin
        Item.Setrange("Drop Shipment Filter");
    end;

    procedure DrillDownCalcOverdueSalesInvoiceAmount()
    var
        [SecurityFiltering(SecurityFilter::Filtered)]
        CustLedgerEntry: Record "Cust. Ledger Entry";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        // OnBeforeDrillDownCalcOverdueSalesInvoiceAmount(CustLedgerEntry, IsHandled);
        if IsHandled then
            exit;

        SetFilterOverdueSalesInvoice(CustLedgerEntry, false);
        CustLedgerEntry.SetFilter("Remaining Amt. (LCY)", '<>0');
        CustLedgerEntry.SetCurrentKey("Remaining Amt. (LCY)");
        CustLedgerEntry.Ascending := false;

        PAGE.Run(PAGE::"Customer Ledger Entries", CustLedgerEntry);
    end;


    procedure SetFilterOverdueSalesInvoice(var CustLedgerEntry: Record "Cust. Ledger Entry"; CalledFromWebService: Boolean)
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        //  OnBeforeSetFilterOverdueSalesInvoice(CustLedgerEntry, CalledFromWebService, IsHandled);
        if IsHandled then
            exit;

        CustLedgerEntry.SetRange("Document Type", CustLedgerEntry."Document Type"::Invoice);
        CustLedgerEntry.SetRange(Open, true);
        if CalledFromWebService then
            CustLedgerEntry.SetFilter("Due Date", '<%1', Today)
        else
            CustLedgerEntry.SetFilter("Due Date", '<%1', GetDefaultWorkDate());
    end;

    local procedure GetDefaultWorkDate(): Date
    var
        LogInManagement: Codeunit LogInManagement;
        defaultWorkDate: Date;
    begin
        if DefaultWorkDate = 0D then
            DefaultWorkDate := LogInManagement.GetDefaultWorkDate();
        exit(DefaultWorkDate);
    end;


    procedure GetAmountFormat(): Text
    var
        TypeHelper: Codeunit "Type Helper";
    begin
        exit(TypeHelper.GetAmountFormatLCYWithUserLocale());
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterInsertEvent', '', true, true)]
    local procedure OnAfterInsertEvent1(var Rec: Record "Sales Header"; RunTrigger: Boolean)
    begin

        // if rec."Ship-to Code" <> '' then
        //     rec."Alt Address" := 'Alternative Address'

        // else
        //     rec."Alt Address" := '';
        // rec.Modify();



        if rec."Ship-to Address" <> Rec."Sell-to Address" then
            rec."Alt Address" := 'Alternative Address'
        else
            Rec."Alt Address" := '';
        rec.Modify();


    end;

}

