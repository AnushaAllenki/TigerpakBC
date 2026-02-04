namespace TigerpakBC.TigerpakBC;

using Microsoft.Purchases.Reports;

reportextension 70102 "Remittance Advice - EntriesExt" extends "Remittance Advice - Entries"
{
    dataset
    {
        add(VendLedgEntry2)
        {
            column(Document_Date; "Document Date")
            {

            }

        }

        add("Vendor Ledger Entry")
        {
            column(Posting_Date; "Posting Date")
            {

            }
        }
    }
}
