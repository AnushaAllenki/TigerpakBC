namespace ALProject.ALProject;

using Microsoft.Inventory.Journal;

pageextension 70131 "Item Reclass. Journal Ext" extends "Item Reclass. Journal"
{

    layout
    {
        addafter("Bin Code")
        {
            field(Narrative; Rec.Narrative)
            {
                ApplicationArea = All;
                Caption = 'Narrative';
                ToolTip = 'Enter a narrative for the item reclassification journal.';

            }
        }
    }
}
