codeunit 70101 EventSubscriptionSQ
{
    TableNo = "Event Subscription";
    [Eventsubscriber(ObjectType::Table, Database::"Sales Header", OnAftermodifyEvent, '', false, false)]
local procedure Onaftermodify(var Rec: Record "Sales Header"; RunTrigger: Boolean)
begin
    if Rec."Document Type" = Rec."Document Type"::Quote then
    if rec."Master SQ No." <> '' then
        if rec."Requested Delivery Date" = 0D then
            rec."Requested Delivery Date" := Today;
end;
}
    

