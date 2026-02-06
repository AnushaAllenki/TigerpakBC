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
        }

        addafter("Shipment Date")
        {
            field("Order creation time/date"; Rec."Order creation time/date")        // field added for API page AzureSalesLines - Tommy
            {
                ApplicationArea = All;
                Caption = 'Order creation time/date';
                ToolTip = 'Order creation time/date';
                Editable = false;
            }
        }
        addafter("Location Code")   // field added for API page AzureSalesLines - Tommy
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

                    //Rec.SetRange("Document Type", Rec."Document Type"::Invoice);
                    //Rec.SetRange("Type", Rec."Type"::Item);
                    // rec.SetRange("No.", SKU."Item No.");
                    // Rec.SetRange("Location Code", SKU."Location Code");
                    // if Rec.FindFirst() then begin

                    //     rec."TP Unit Cost_New" := SKU."TP Unit Cost_New";
                    //     rec.Modify();
                    // end;
                    salesLine.reset();
                    salesLine.SetRange("Document Type", salesLine."Document Type"::Quote);
                    salesLine.SetFilter("Document No.", 'MSQ*');   // To update TP Unit Cost_new for only MSQ-N*/ MSQ*sales quotes
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
            action("Update TP Profit %_New")  //#246-Customer ledger Entry Field
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
                        salesLine.SetRange("Document Type", salesLine."Document Type"::Order);
                        //salesLine.SetRange("Type", salesLine."Type"::Item);
                        if salesLine.FindSet() then begin
                            SH.Reset();
                            SH.SetRange("No.", salesLine."Document No.");
                            if SH.FindFirst() then begin
                                salesLine."WH Exist" := SH."WH Exist";
                                salesLine.Modify();
                            end;

                        end;
                    until salesLine.next = 0;
                end;
            }

        }


    }
}