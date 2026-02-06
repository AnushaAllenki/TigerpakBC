pageextension 70112 SalesLinesExt extends "Sales Lines"
{

    layout
    {
        addafter("Unit of Measure Code")
        {
            field("TP Unit Cost_New"; Rec."TP Unit Cost_New")
            {
                ApplicationArea = All;
                Caption = 'TP Unit Cost_New';
                ToolTip = 'TP Unit Cost_New';
                Editable = true;

            }
            field("TP Profit%_New"; Rec."TP Profit%_New")
            {
                ApplicationArea = All;
                Caption = 'TP Profit%_New';
                ToolTip = 'TP Profit%_New';
                Editable = true;

            }
        }

        addafter("Outstanding Quantity")   // field added for APU page AzureSalesLines - Tommy
        {
            field("Order creation time/date"; Rec."Order creation time/date")
            {
                ApplicationArea = All;
                Caption = 'Order creation time/date';
                ToolTip = 'Order creation time/date';
                Editable = true;

            }
            field("Item Category Group"; Rec."Item Category Group")
            {
                ApplicationArea = All;
                Caption = 'Item Category Group';
                ToolTip = 'Item Category Group';


            }


            // field("TP_Order Creation Date/Time"; Rec."TP_Order Creation Date/Time")
            // {
            //     ApplicationArea = All;
            //     Caption = 'TP_Order Creation Date/Time';
            //     ToolTip = 'TP_Order Creation Date/Time';

            // }
        }

        addafter("Location Code")
        {
            field("WH Exist"; Rec."WH Exist")
            {
                ApplicationArea = All;
                Caption = 'WH Exist';
                ToolTip = 'WH Exist';

            }
        }




    }

    actions
    {
        addafter("Show Document")
        {
            action(DeleteLine)
            {
                ApplicationArea = All;
                Caption = 'Delete Line';
                Image = Delete;

                trigger OnAction()
                var
                    salesLine: Record "Sales Line";
                begin
                    CurrPage.SetSelectionFilter(salesLine);
                    if salesLine.FindFirst then
                        if Confirm('Are you sure you want to delete this line?') then
                            repeat
                                // if salesLine."Select Line" then
                                salesLine.Delete;
                            until salesLine.next = 0;
                    // Message('Selected Lines Deleted')


                end;
            }

            action("Update Item Category Group")
            {
                ApplicationArea = All;
                Caption = 'Update Item Category Group';
                Image = EditLines;

                trigger OnAction()
                var
                    salesLine: Record "Sales Line";
                    item: Record Item;
                begin
                    //CurrPage.SetSelectionFilter(salesLine);
                    salesLine.SetFilter("Document Type", '%1', salesLine."Document Type"::Order);
                    salesLine.SetRange("Type", salesLine."Type"::Item);
                    if salesLine.FindFirst then
                        repeat
                            item.SetRange("No.", salesLine."No.");
                            if item.FindFirst then begin
                                salesLine."Item Category Group" := item."Item Category Group";
                                salesLine.Modify();
                            end;
                        until salesLine.next = 0;
                end;
            }
            // action("Update Order Creation Date/Time")   //Commented because of empty set warning error in sales order and need to identify the issue and fix it back
            // {
            //     ApplicationArea = All;
            //     Caption = 'Update Order Creation Date/Time';
            //     Image = EditLines;

            //     trigger OnAction()
            //     var
            //         salesLine: Record "Sales Line";
            //         salesHeader: Record "Sales Header";
            //     begin
            //         //CurrPage.SetSelectionFilter(salesLine);
            //         salesLine.SetFilter("Document Type", '%1', salesLine."Document Type"::Order);
            //         if salesLine.FindFirst then
            //             repeat
            //                 salesHeader.SetRange("No.", salesLine."Document No.");
            //                 if salesHeader.FindFirst then begin
            //                     salesLine."TP_Order Creation Date/Time" := salesHeader."Order creation time/date";
            //                     salesLine.Modify();
            //                 end;
            //             until salesLine.next = 0;
            //     end;
            // }
        }

        addafter("Show Document")
        {
            action("Rounding Unit Price")
            {
                ApplicationArea = All;
                Caption = 'Rounding Unit Price';
                ToolTip = 'Rounding Unit Price';
                Image = Action;

                trigger OnAction()
                var
                    salesLine: Record "Sales Line";
                    salesHeader: Record "Sales Header";
                begin

                    salesLine.SetRange("Document Type", salesLine."Document Type"::Quote);
                    salesLine.SetFilter("Document No.", 'MSQ-N*');
                    salesLine.SetRange("Type", salesLine."Type"::Item);
                    salesLine.SetFilter(Quantity, '<>0');
                    salesLine.SetFilter("Unit Price", '<>0');
                    if salesLine.FindSet then begin
                        repeat
                            salesLine."Unit Price" := Round(salesLine."Unit Price", 0.01);
                            salesLine.Validate("Line Amount", salesLine."Unit Price" * salesLine.Quantity);
                            salesLine.Modify();
                        until salesLine.next = 0;
                    end;


                end;

            }
        }

        addafter("Show Document")
        {
            action("Update TP Unit Cost_New")
            {
                ApplicationArea = All;
                Caption = 'Update All Tp Unit Cost_New';
                Image = Action;

                trigger OnAction()
                var
                    salesLine: Record "Sales Line";
                    SKU: Record "Stockkeeping Unit";
                begin
                    // repeat
                    //     //Rec.SetRange("Document Type", Rec."Document Type"::Invoice);
                    //     //Rec.SetRange("Type", Rec."Type"::Item);
                    //     rec.SetRange("No.", SKU."Item No.");
                    //     Rec.SetRange("Location Code", SKU."Location Code");
                    //     if Rec.FindFirst() then begin

                    //         rec."TP Unit Cost_New" := SKU."TP Unit Cost_New";
                    //         rec.Modify();
                    //     end;
                    // until Rec.Next() = 0;
                    salesLine.reset();
                    salesLine.SetRange("Document Type", salesLine."Document Type"::Quote);
                    salesLine.SetRange("Type", salesLine."Type"::Item);
                    if salesLine.FindSet() then
                        repeat
                            SKU.Reset();
                            SKU.SetRange("Item No.", salesLine."No.");
                            SKU.SetRange("Location Code", salesLine."Location Code");
                            if SKU.FindFirst() then begin
                                salesLine.Validate("TP Unit Cost_New", SKU."Tp Unit Cost_New");
                                salesLine.Modify();
                            end;
                        until salesLine.next = 0;

                end;

            }
            action("Update TP Profit %_New")
            {
                ApplicationArea = All;
                Caption = 'Update All Tp Profit %_New';
                Image = Action;

                trigger OnAction()
                var
                    salesLine: Record "Sales Line";
                begin
                    repeat
                        salesLine.reset();
                        salesLine.SetRange("Document Type", salesLine."Document Type"::Quote);
                        salesLine.SetRange("TP Profit%_New", 0);
                        salesLine.SetRange("Type", salesLine."Type"::Item);

                        if salesLine.FindSet() then begin

                            if salesLine."Unit Price" = 0 then
                                salesLine."TP Profit%_New" := 0
                            else
                                salesLine."TP Profit%_New" := Round(((salesLine."Unit Price" - salesLine."TP Unit Cost_New") / salesLine."Unit Price") * 100, 0.01, '=');
                            salesLine.Modify();

                        end;
                    until salesLine.next = 0;
                end;
            }
            action("Update WH Exist")
            {
                ApplicationArea = All;
                Caption = 'Update All WH Exist';
                Image = Action;

                trigger OnAction()
                var
                    salesLine: Record "Sales Line";
                    SH: Record "Sales Header";
                begin
                    repeat
                        salesLine.reset();
                        salesLine.SetRange("Document Type", salesLine."Document Type"::Quote);
                        salesLine.SetRange("Type", salesLine."Type"::Item);
                        if salesLine.FindSet() then begin
                            SH.Reset();
                            SH.SetRange("No.", salesLine."Document No.");
                            if SH.FindFirst() then begin
                                salesLine.Validate("WH Exist", SH."WH Exist");
                                salesLine.Modify();
                            end;

                        end;
                    until salesLine.next = 0;
                end;
            }



        }
    }
}