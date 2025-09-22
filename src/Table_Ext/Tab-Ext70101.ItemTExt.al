tableextension 70101 "Item_T-Ext" extends Item
{
    fields
    {

        field(70100; "US-Agreed Usage"; Decimal)
        {
            Caption = 'US-Agreed Usage';
            DataClassification = ToBeClassified;
        }
        field(70101; "US-Actual Usage"; Decimal)
        {
            Caption = 'US-Actual Usage';
            DataClassification = ToBeClassified;
        }
        field(70102; "US- Agreement Start Date"; Date)
        {
            Caption = 'US- Agreement Start Date';
            DataClassification = ToBeClassified;
        }
        field(70103; "US-Expiry Date"; Date)
        {
            Caption = 'US-Expiry Date';
            DataClassification = ToBeClassified;
        }
        field(70104; "US-Agreed Months Stock on Hand"; Decimal)
        {
            Caption = 'US-Agreed Months Stock on Hand';
            DataClassification = ToBeClassified;
        }
        field(70105; "US-Actual Stock on Hand"; Decimal)
        {
            Caption = 'US-Actual Stock on Hand';
            DataClassification = ToBeClassified;
        }

        modify(Classification)
        {
            trigger OnAfterValidate()
            begin
                if Rec.Classification = rec.Classification::DISCONTINUED then
                    Rec."IA_Custom002" := rec.IA_Custom002::"Obsolete (O)"

            end;
        }
        field(70106; Inventory_SYD; Decimal)
        {
            CalcFormula = sum("Item Ledger Entry".Quantity where("Item No." = field("No."),
                                                                  "Location Code" = filter('NSW-MP'),
                                                                  "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                                  "Global Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                                  "Drop Shipment" = field("Drop Shipment Filter"),
                                                                  "Variant Code" = field("Variant filter")));
            Caption = 'Inventory SYD';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(70107; Inventory_MEL; Decimal)
        {
            CalcFormula = sum("Item Ledger Entry".Quantity where("Item No." = field("No."),
                                                                  "Location Code" = filter('VIC-DS'),
                                                                  "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                                  "Global Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                                  "Drop Shipment" = field("Drop Shipment Filter"),
                                                                  "Variant Code" = field("Variant filter")));
            Caption = 'Inventory MEL';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(70108; Inventory_QLD; Decimal)
        {
            CalcFormula = sum("Item Ledger Entry".Quantity where("Item No." = field("No."),
                                                                  "Location Code" = filter('QLD-LG'),
                                                                  "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                                  "Global Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                                  "Drop Shipment" = field("Drop Shipment Filter"),
                                                                  "Variant Code" = field("Variant filter")));
            Caption = 'Inventory QLD';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(70109; Inventory_SA; Decimal)
        {
            CalcFormula = sum("Item Ledger Entry".Quantity where("Item No." = field("No."),
                                                                  "Location Code" = filter('SA-WV'),
                                                                  "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                                  "Global Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                                  "Drop Shipment" = field("Drop Shipment Filter"),
                                                                  "Variant Code" = field("Variant filter")));
            Caption = 'Inventory SA';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(70110; Inventory_WA; Decimal)
        {
            CalcFormula = sum("Item Ledger Entry".Quantity where("Item No." = field("No."),
                                                                  "Location Code" = filter('WA-WG'),
                                                                  "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                                  "Global Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                                  "Drop Shipment" = field("Drop Shipment Filter"),
                                                                  "Variant Code" = field("Variant filter")));
            Caption = 'Inventory WA';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }

        field(70111; "Item Category Group"; Option)
        {
            Caption = 'Item Category Group';
            DataClassification = ToBeClassified;
            OptionMembers = " ","Adhesive & Wrapping Solutions","Primary Packaging Materials","Shipping & Protective Solutions","Industrial & Workplace Essentials";

        }

        // modify("Gen. Prod. Posting Group")
        // {
        //     TableRelation = "Gen. Product Posting Group".code where("Item Category Group" = field("Item Category Group"));

        // }

        field(70112; "Purchase Order Multiples"; Code[20])
        {
            Caption = 'Purchase UOM_Netstock';
            DataClassification = ToBeClassified;
            TableRelation = "Item Unit of Measure".code where("item no." = field("no."), Code = field("Purchase Order Multiples"));


        }

        field(70113; "Gen. Prod. Posting Group New"; Code[20])
        {
            Caption = 'Gen. Prod. Posting Group';
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Product Posting Group".code where("Item Category Group" = field("Item Category Group"));

            trigger OnValidate()
            var
                GenProdPostingGroup: Record "Gen. Product Posting Group";
            begin
                // GenProdPostingGroup.get(rec."Gen. Prod. Posting Group New");
                // if GenProdPostingGroup.FindFirst() then
                Validate("Gen. Prod. Posting Group", "Gen. Prod. Posting Group New");
            end;
        }

        field(70114; "Provisional Cost%"; Decimal)
        {
            Caption = 'Provisional Cost%';
            DataClassification = ToBeClassified;



            trigger OnValidate()
            var
                SKU: Record "Stockkeeping Unit";
            begin
                SKU.SetRange("item No.", Rec."No.");

                if SKU.FindFirst() then begin
                    repeat
                        SKU."TP Unit Cost_New" := SKU."TP Unit Cost" - (SKU."TP Unit Cost") * Rec."Provisional Cost%" / 100;
                        SKU.Modify();
                    until SKU.Next() = 0;

                end;
            end;


        }

        field(70115; "HACCP Item"; Boolean)
        {
            Caption = 'HACCP Item';
            DataClassification = ToBeClassified;

        }









    }
    trigger OnInsert()
    var
        BinContent: Record "Bin Content";
    begin

        BinContent.SetRange("Item No.", Rec."No.");
        if BinContent.Findset() then begin
            BinContent.Blocked_Item := Rec."Blocked";
            BinContent."HACCP Item" := Rec."HACCP Item";
            BinContent.Modify();

        end;
    end;




    // trigger OnModify()
    // var
    //     SKU: Record "Stockkeeping Unit";
    // begin
    //     SKU.SetRange("item No.", Rec."No.");
    //     if SKU.FindFirst() then begin
    //         SKU."TP Unit Cost_New" := SKU."TP Unit Cost" - (SKU."TP Unit Cost") * Rec."Provisional Cost%" / 100;
    //         SKU.Modify();
    //     end;
    // end;

}
