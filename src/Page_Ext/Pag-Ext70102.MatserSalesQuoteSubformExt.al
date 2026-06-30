pageextension 70102 "Matser Sales Quote Subform_Ext" extends "Matser Sales Quote Subform"
{
    layout
    {
        modify("Line Discount %")
        {
            Visible = false;
            Editable = false;
            Enabled = false;
        }
        modify("Line Discount Amount")
        {
            Visible = false;
            Editable = false;
            Enabled = false;

        }
        addafter("Line Discount Amount")    //#246-Customer ledger Entry Field 
        {
            field("TP Unit Cost_New"; Rec."TP Unit Cost_New")
            {
                ApplicationArea = All;
                Caption = 'TP Unit Cost_New';
                ToolTip = 'The TP Unit Cost_New field shows the new TP unit cost for the sales quote line.';
            }

            field("TP Profit%_New"; Rec."TP Profit%_New")
            {
                ApplicationArea = All;
                Caption = 'TP Profit%_New';
                ToolTip = 'The TP Profit%_New field shows the new TP profit percentage for the sales quote line.';
            }
        }
        addafter("Location Code")    // adding backorder status field in Master sales quote subform - Tommy
        {
            field("Backorder Status"; Rec."Backorder Status")
            {
                ApplicationArea = All;
                Caption = 'Backorder Status';
                ToolTip = 'The Backorder Status field shows the backorder status for the sales quote line.';
            }
        }


        modify("TP Unit Cost")
        {
            Visible = false;
            Enabled = false;
        }
        modify("TP Profit %")
        {
            Visible = false;
            Enabled = false;
        }


    }
    actions
    {
        // addlast(processing)  // Edit in Excel feature in MSQ lines - Need to confirm with Tommy to publish this feature
        // {
        //     group(Excel)
        //     {
        //         Caption = 'Excel';

        //         action(EditInExcel)
        //         {
        //             ApplicationArea = Basic, Suite;
        //             Caption = 'Edit in Excel';
        //             Image = Excel;
        //             ToolTip = 'Send the data in the sub page to an Excel file for analysis or editing';
        //             AccessByPermission = System "Allow Action Export To Excel" = X;


        //             trigger OnAction()
        //             var
        //                 EditinExcel: Codeunit "Edit in Excel";
        //                 EditinExcelFilters: Codeunit "Edit in Excel Filters";
        //             begin
        //                 EditinExcelFilters.AddFieldV2(
        //                     'Document_No',
        //                     Enum::"Edit in Excel Filter Type"::Equal,
        //                     Rec."Document No.",
        //                     Enum::"Edit in Excel Edm Type"::"Edm.String"
        //                 );

        //                 EditinExcel.EditPageInExcel(
        //                     'salesQuoteLines',
        //                     Page::"Matser Sales Quote Subform",
        //                     EditinExcelFilters,
        //                     StrSubstNo('Sales Quote %1', Rec."Document No.")
        //                 );
        //             end;

        //         }
        //     }
        // }
        addafter("Update Sales Price")
        {
            action("Delete Line & Price Line")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Delete Line & Price Line';
                Ellipsis = true;
                Image = Action;
                trigger OnAction()
                var
                    Pricelistline: Record "Price List Line";
                    SRsetup: Record "Sales & Receivables Setup";
                begin
                    SRsetup.get;
                    Pricelistline.SetRange("Price List Code", SRsetup."Default Price List Code");
                    Pricelistline.SetRange("Source Type", Pricelistline."Source Type"::Customer);
                    Pricelistline.SetRange("Assign-to No.", rec."Sell-to Customer No.");
                    Pricelistline.SetRange("Product No.", rec."No.");
                    Pricelistline.SetRange("Minimum Quantity", Rec."Quantity");
                    Pricelistline.SetRange("Unit of Measure Code", Rec."Unit of Measure Code");
                    if Pricelistline.FindFirst() then begin
                        Pricelistline.Delete();
                    end;
                    rec.Delete();


                end;
            }
        }
    }
}
