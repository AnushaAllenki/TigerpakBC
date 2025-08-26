pageextension 70110 PurchaseOrderArchiveSubfor_Ext extends "Purchase Order Archive Subform"
{
    layout
    {
        addlast(content)
        {
            field(amountbeforediscount; Totalpurchaselinearchive."Line Amount")
            {
                ApplicationArea = Suite;
                AutoFormatType = 1;
                // CaptionClass = DocumentTotals.GetTotalLineAmountWithVATAndCurrencyCaption(Currency.Code, Totalpurchaseheaderarchive."Prices Including VAT");
                Caption = 'Subtotal Excl. VAT';
                Editable = false;
                ToolTip = 'Specifies the sum of the value in the Line Amount Excl. VAT field on all lines in the document.';

            }
        }
    }

    var
        Totalpurchaselinearchive: Record "Purchase Line Archive";
        Totalpurchaseheaderarchive: Record "Purchase Header Archive";



}
