pageextension 70114 "O365 Activities Ext" extends "O365 Activities"
{
    layout
    {
        addafter("Ongoing Sales invoices")
        {
            field("Customers - Blocked"; Rec."Customers - Blocked")
            {
                ApplicationArea = All;
                ToolTip = 'Customers - Blocked';
                Editable = false;
            }

        }

    }


}