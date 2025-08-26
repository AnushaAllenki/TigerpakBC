namespace ALProject.ALProject;

using Microsoft.Sales.History;
using Microsoft.Finance.GeneralLedger.Setup;

pageextension 70128 "Posted Sales Inv. - Update Ext" extends "Posted Sales Inv. - Update"
{

    layout
    {
        addafter("Payment Method Code")
        {
            field("Payment Terms Code"; Rec."Payment Terms Code")

            {
                ApplicationArea = All;
                ToolTip = 'Payment Terms Code';
                Editable = true;
                Visible = IsPaymentTermCodeVisible;


            }




        }

        // addafter("Posting Description")
        // {
        //     field("External Document No."; Rec."External Document No.")
        //     {
        //         ApplicationArea = All;
        //         ToolTip = 'External Document No.';
        //         Editable = true;
        //         Visible = true;
        //     }
        // }




    }

    trigger OnOpenPage()
    begin
        xSalesInvoiceHeader := Rec;
        GLSetup.Get();
        IsPaymentTermCodeVisible := not GLSetup."Hide Payment Method Code";

    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        if CloseAction = ACTION::LookupOK then
            if RecordChanged() then
                CODEUNIT.Run(CODEUNIT::"Sales Inv. Header - Edit", Rec);
    end;

    var
        IsPaymentTermCodeVisible: Boolean;
        xSalesInvoiceHeader: Record "Sales Invoice Header";
        GLSetup: Record "General Ledger Setup";


    procedure RecordChanged() IsChanged: Boolean
    begin
        IsChanged := (Rec."Payment Terms Code" <> xSalesInvoiceHeader."Payment Terms Code");
        OnAfterRecordChanged(Rec, xSalesInvoiceHeader, IsChanged);
    end;

    local procedure OnAfterRecordChanged(var SalesInvoiceHeader: Record "Sales Invoice Header"; xSalesInvoiceHeader: Record "Sales Invoice Header"; var IsChanged: Boolean)
    begin
    end;


}

