pageextension 70109 "Customer Card_Ext" extends "Customer Card"
{
    layout
    {
        addafter("Customized Calendar")
        {
            field("Xmas Trading Hours"; Rec."Xmas Trading Hours")
            {
                ApplicationArea = All;
            }
        }

        modify("Account Status")
        {
            Editable = false;

        }
        modify("Blocked")
        {
            trigger OnafterValidate()
            var
                userSetup: Record "User Setup";
                user: Record User;
                userconfig: Record "User Configuration";
            // begin
            //     if userSetup.Get("UserID") then
            //         if not userSetup."Allow Unblock Customer" then
            //             if xrec.blocked = xRec.Blocked::Invoice then begin
            //                 if rec.Blocked <> rec.Blocked::Invoice then
            //                     Error('You are not allowed to unblock the customer');
            //             end;

            // end;
            begin

                if userconfig.Get(UserID) then begin
                    if not userconfig."Allow Unblock Customers" then begin
                        if rec.Blocked <> rec.Blocked::Invoice then begin
                            if xrec.blocked = xRec.Blocked::Invoice then
                                Error('You are not allowed to unblock the customer');
                        end;
                    end;
                end else begin
                    //if rec.Blocked = rec.Blocked::Invoice then
                    Error('You are not allowed to unblock the customer');
                end;
            end;
        }
        addafter("Format Region")
        {
            field(Reseller; Rec.Reseller)
            {
                ApplicationArea = All;
                Caption = 'Reseller';

            }
        }
        addafter("Document Sending Profile")
        {
            field("Marketing Industry"; Rec."Marketing Industry")
            {
                ApplicationArea = All;
                Caption = 'Marketing Industry';
            }
        }
    }
}
