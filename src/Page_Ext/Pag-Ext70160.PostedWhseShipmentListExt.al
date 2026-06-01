pageextension 70160 "Posted Whse. Shipment List Ext" extends "Posted Whse. Shipment List"
{
    layout
    {
        addafter("DC Send Email")
        {
            field("Your Reference"; Rec."Your Reference")
            {
                ApplicationArea = All;
            }

            field("Web Order No."; Rec."Web Order No.")
            {
                ApplicationArea = All;
                Caption = 'Web Order No.';
            }
        }


    }

    actions
    {
        addafter("Co&mments")
        {
            action("Update Your Reference")
            {
                ApplicationArea = All;
                Caption = 'Update Your Reference';
                Image = Edit;

                trigger OnAction()
                var

                    eventsub1: Codeunit "EventSubscribers1";
                begin
                    eventsub1.UpdateYourReference();    // Copying Your Reference from sales order to posted wshe shipments for web services API
                end;
            }
        }
    }
}
