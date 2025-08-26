pageextension 70115 "Bookkeeper Activities Ext" extends "Bookkeeper Activities"
{
    layout
    {
        addbefore(Payables)
        {
            cuegroup(Control54)
            {
                CueGroupLayout = Wide;
                ShowCaption = false;
                // field("Sales This Month"; Rec."Sales This Month")
                // {
                //     ApplicationArea = Basic, Suite;
                //     DrillDownPageID = "Sales Invoice List";
                //     ToolTip = 'Specifies the sum of sales in the current month excluding taxes.';

                //     trigger OnDrillDown()
                //     begin
                //         ActivitiesMgt.DrillDownSalesThisMonth();
                //     end;
                // }
                field("Overdue Sales Invoice Amount"; Rec."Overdue Sales Invoice Amount")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the sum of overdue payments from customers.';

                    trigger OnDrillDown()
                    begin
                        ActivitiesMgt.DrillDownCalcOverdueSalesInvoiceAmount();
                    end;
                }
                field("Overdue Purch. Invoice Amount"; Rec."Overdue Purch. Invoice Amount")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the sum of your overdue payments to vendors.';

                    trigger OnDrillDown()
                    begin
                        ActivitiesMgt.DrillDownOverduePurchaseInvoiceAmount();
                    end;
                }
            }

        }
        addafter("Approved Sales Orders")
        {
            field("Customers - Blocked"; Rec."Customers - Blocked")
            {
                ApplicationArea = All;
                ToolTip = 'Customers - Blocked';
                Editable = false;

            }
        }

    }
    trigger OnOpenPage()
    begin
        CalculateCueFieldValues
    end;

    procedure CalculateCueFieldValues()
    var
        TaskId: Integer;
    begin
        if PBTList.Count() > 0 then
            foreach TaskId in PBTList.Keys do begin
                CurrPage.CancelBackgroundTask(TaskId);
                PBTList.Remove(TaskId);
            end;

        SchedulePBT(Rec.FieldName("Overdue Sales Invoice Amount"), Rec.FieldCaption("Overdue Sales Invoice Amount"));
        SchedulePBT(Rec.FieldName("Overdue Purch. Invoice Amount"), Rec.FieldCaption("Overdue Purch. Invoice Amount"));
        // SchedulePBT(Rec.FieldName("Sales This Month"), Rec.FieldCaption("Sales This Month"));
        // SchedulePBT(Rec.FieldName("Top 10 Customer Sales YTD"), Rec.FieldCaption("Top 10 Customer Sales YTD"));
        // SchedulePBT(Rec.FieldName("Average Collection Days"), Rec.FieldCaption("Average Collection Days"));
        // SchedulePBT(Rec.FieldName("S. Ord. - Reserved From Stock"), Rec.FieldCaption("S. Ord. - Reserved From Stock"));
    end;

    local procedure SchedulePBT(FieldName: Text; FieldCaption: Text)
    var
        Input: Dictionary of [Text, Text];
        TimeoutinMs: Integer;
    begin
        TimeoutinMs := 2000; // Default timeout;
        //OnGetBackgroundTaskTimeout(TimeoutInMs);
        Clear(Input);
        Input.Add(FieldName, '');
        CurrPage.EnqueueBackgroundTask(TaskIdCalculateCue, Codeunit::"O365 Activities Dictionary", Input, TimeoutInMs);
        PBTList.Add(TaskIdCalculateCue, FieldCaption);
    end;

    trigger OnPageBackgroundTaskError(TaskId: Integer; ErrorCode: Text; ErrorText: Text; ErrorCallStack: Text; var IsHandled: Boolean)
    var
        ScheduledTask: Record "Scheduled Task";
    begin
        Session.LogMessage('00009V0', StrSubstNo(PBTTelemetryMsgTxt, ErrorCode, ErrorText, ErrorCallStack), Verbosity::Warning, DataClassification::CustomerContent, TelemetryScope::ExtensionPublisher, 'Category', PBTTelemetryCategoryLbl);

        if not PBTList.ContainsKey(TaskId) then
            exit;

        //if ActivitiesMgt.IsCueDataStale() then

        if not TASKSCHEDULER.CanCreateTask() then
            CODEUNIT.Run(CODEUNIT::"Activities Mgt.")
        else begin
            ScheduledTask.SetRange("Run Codeunit", CODEUNIT::"Activities Mgt.");
            ScheduledTask.SetRange(Company, CompanyName);
            ScheduledTask.SetRange("Is Ready", true);
            if ScheduledTask.IsEmpty() then
                TASKSCHEDULER.CreateTask(CODEUNIT::"Activities Mgt.", 0, true, CompanyName, CurrentDateTime);
        end;

        IsHandled := true;
    end;

    trigger OnPageBackgroundTaskCompleted(TaskId: Integer; Results: Dictionary of [Text, Text])
    var
        O365ActivitiesDictionary: Codeunit "O365 Activities Dictionary";
    begin
        // As PBT runs synchronously when running in test, the task is called even before PBTList is updated.
        // So, we use (TaskIdCalculateCue = TaskId) to check if the task is the one we are interested in.
        if PBTList.ContainsKey(TaskId) or (TaskIdCalculateCue = TaskId) then begin
            Rec.LockTable(true);
            Rec.Get();
            //o365ActivitiesDictionary.
            FillActivitiesCue(Results, Rec);

            if PBTList.ContainsKey(TaskId) then begin
                PBTList.Remove(TaskId);
                if PBTList.Count() = 0 then
                    Rec."Date Filter" := Today;
            end;
            Rec.Modify(true);
            Commit();
        end
    end;

    procedure FillActivitiesCue(DataList: Dictionary of [Text, Text]; var ActivitiesCue: record "finance Cue")
    begin
        // if DataList.ContainsKey(ActivitiesCue.FieldName("Sales This Month")) then
        //     Evaluate(ActivitiesCue."Sales This Month", DataList.Get(ActivitiesCue.FieldName("Sales This Month")));

        if DataList.ContainsKey(ActivitiesCue.FieldName("Overdue Sales Invoice Amount")) then
            Evaluate(ActivitiesCue."Overdue Sales Invoice Amount", DataList.Get(ActivitiesCue.FieldName("Overdue Sales Invoice Amount")));

        if DataList.ContainsKey(ActivitiesCue.FieldName("Overdue Purch. Invoice Amount")) then
            Evaluate(ActivitiesCue."Overdue Purch. Invoice Amount", DataList.Get(ActivitiesCue.FieldName("Overdue Purch. Invoice Amount")));

        // if DataList.ContainsKey(ActivitiesCue.FieldName("Average Collection Days")) then
        //     Evaluate(ActivitiesCue."Average Collection Days", DataList.Get(ActivitiesCue.FieldName("Average Collection Days")));

        // if DataList.ContainsKey(ActivitiesCue.FieldName("S. Ord. - Reserved From Stock")) then
        //     Evaluate(ActivitiesCue."S. Ord. - Reserved From Stock", DataList.Get(ActivitiesCue.FieldName("S. Ord. - Reserved From Stock")));

        // OnAfterFillActivitiesCue(DataList, ActivitiesCue);
    end;

    var
        TaskIdCalculateCue: Integer;
        PBTList: Dictionary of [Integer, Text];
        ActivitiesMgt: Codeunit "Activities Mgt.";
        PBTTelemetryCategoryLbl: Label 'PBT', Locked = true;
        PBTTelemetryMsgTxt: Label 'PBT errored with code %1 and text %2. The call stack is as follows %3.', Locked = true;
}
