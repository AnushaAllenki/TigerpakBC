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
                    SKU: Record "Stockkeeping Unit";
                begin
                    repeat
                        //Rec.SetRange("Document Type", Rec."Document Type"::Invoice);
                        //Rec.SetRange("Type", Rec."Type"::Item);
                        rec.SetRange("No.", SKU."Item No.");
                        Rec.SetRange("Location Code", SKU."Location Code");
                        if Rec.FindFirst() then begin

                            rec."TP Unit Cost_New" := SKU."TP Unit Cost_New";
                            rec.Modify();
                        end;
                    until Rec.Next() = 0;

                end;

            }
        }


    }
}