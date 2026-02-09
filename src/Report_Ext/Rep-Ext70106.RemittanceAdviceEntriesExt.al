namespace TigerpakBC.TigerpakBC;

using Microsoft.Purchases.Reports;

reportextension 70106 "Remittance Advice - EntriesExt" extends "Remittance Advice - Entries"
{
    dataset
    {

        add("Vendor Ledger Entry")
        {
            column(Posting_Date; "Posting Date") { } //Posting Date in Header of the report
            column(Document_Date_VendorLedgerEntry; "Document Date") { } //Document Date in Header of the report

        }
        add(VendLedgEntry2)
        {
            column(Document_Date; "Document Date") { } //Document Date in Lines of the report
            column(Document_No_VLE2; "Document No.") { }

        }
    }
}
