page 50100 IE_StudentList
{

    PageType = List;
    SourceTable = IE_Student;
    Caption = 'Student List';
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Student ID"; "Student ID")
                {
                    ApplicationArea = All;
                }
                field("Student First Name"; "Student First Name")
                {
                    ApplicationArea = All;
                }
                field("Student Last Name"; "Student Last Name")
                {
                    ApplicationArea = All;
                }
                field("Student Email ID"; "Student Email ID")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(IE_ImportStudentData)
            {
                ApplicationArea = All;
                Caption = 'Import Student Data';
                Image = Excel;
                RunObject = report IE_ImportExcel;
            }
            action(IE_ExportStudentData)
            {
                ApplicationArea = All;
                Caption = 'Export Student Data';
                Image = Excel;
                trigger OnAction()
                var
                    ExportData: Report IE_ExportExcel;
                begin
                    if Rec.FindSet() then
                        ExportData.Run();
                end;
            }
        }
    }
}
