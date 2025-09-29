namespace ALProject.ALProject;

using Microsoft.Sales.History;

tableextension 70115 "Sales Invoice Line Ext" extends "Sales Invoice Line"
{
    fields
    {
        field(70100; "TP Unit Cost_New"; Decimal)
        {
            Caption = 'TP Unit Cost_New';
            DataClassification = ToBeClassified;
        }
        field(70101; "External Document No."; Code[50])  // #290 Posted Sales Invoice Lines - External Document No. field update from Sales Invoice Header
        {
            Caption = 'External Document No.';
            DataClassification = ToBeClassified;


        }
    }
}
