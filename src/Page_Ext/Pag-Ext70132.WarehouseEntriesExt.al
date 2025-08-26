namespace ALProject.ALProject;

using Microsoft.Warehouse.Ledger;
using Microsoft.Inventory.Journal;

pageextension 70132 "Warehouse Entries Ext" extends "Warehouse Entries"
{

    layout
    {

        addafter("Bin Code")
        {
            field(Narrative; Rec.Narrative)
            {
                ApplicationArea = All;
                Caption = 'Narrative';
                ToolTip = 'Enter a narrative for the warehouse entries.';


            }

        }

    }
    var
        IJL: Record "Item Journal Line";

}
