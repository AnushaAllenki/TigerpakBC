namespace ALProject.ALProject;

using Microsoft.Purchases.Document;

page 70101 "TP Purchase Line"
{
    APIGroup = 'apiGroup';
    APIPublisher = 'Tigerpak';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'purchaseLineExt';
    DelayedInsert = true;
    EntityName = 'TPPurchaseLine';
    EntitySetName = 'TPPurchaseLines';
    PageType = API;
    SourceTable = "Purchase Line";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("PurchaserCode"; Rec."Purchaser Code")
                {
                    ApplicationArea = All;
                    Caption = 'Purchaser Code';
                    ToolTip = 'Specifies the code of the purchaser responsible for this purchase line.';
                    Editable = true;
                }
                field(ItemCategoryGroup; Rec."Item Category Group")
                {
                    ApplicationArea = All;
                    Caption = 'Item Category Group';
                    ToolTip = 'Specifies the item category group for this purchase line.';
                    Editable = true;
                }
            }
        }
    }
}
