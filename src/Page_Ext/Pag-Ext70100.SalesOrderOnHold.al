pageextension 70100 SalesHeader_OnHold extends "Sales Order"
{
    layout
    {
        addafter("Back Order Called")
        {
            field(OnHold; Rec.OnHold)
            {
                ApplicationArea = all;
            }
        }
        addafter("Sell-to Customer Name")
        {
            field("Alt Address"; Rec."Alt Address")
            {
                ApplicationArea = all;
                Caption = 'Alt Address';
                Style = Favorable;
                Editable = false;
            }


        }
        modify("Ship-to Address")
        {
            trigger OnAfterValidate()
            begin
                if rec."Ship-to Address" <> rec."Sell-to Address" then
                    if Rec."Ship-to County" <> Rec."Sell-to County" then
                        rec."Alt Address" := 'Alternate Address'
                    else
                        rec."Alt Address" := '';
            end;
        }
        // modify("Sell-to Contact No.")
        // {
        //     // trigger OnLookup(var Text: Text): Boolean
        //     // var
        //     //     ContactRec: Record Contact;
        //     // begin
        //     //     if ContactRec.get(Rec."Sell-to Contact No.") then begin
        //     //         if ContactRec."Inactive" then
        //     //             Error('This contact is inactive');
        //     //     end;
        //     // end;



        // }


    }
}






