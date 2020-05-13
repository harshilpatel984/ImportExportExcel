report 50101 IE_ExportExcel
{
    Caption = 'Export Excel';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;
    UseRequestPage = false;

    dataset
    {
        dataitem(IE_Student; IE_Student)
        {
            trigger OnPreDataItem()
            begin
                ExcelBuffer.NewRow();
                ExcelBuffer.AddColumn('Student ID', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Student First Name', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Student Last Name', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Student Email Id', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
            end;

            trigger OnAfterGetRecord()
            begin
                ExcelBuffer.NewRow();
                ExcelBuffer.AddColumn(IE_Student."Student ID", false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(IE_Student."Student First Name", false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(IE_Student."Student Last Name", false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(IE_Student."Student Email ID", false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
            end;
        }
    }

    trigger OnInitReport()
    begin
        ExcelBuffer.DeleteAll();
    end;

    trigger OnPostReport()
    begin
        ExcelBuffer.CreateNewBook('StudentData');
        ExcelBuffer.WriteSheet('StudentData', CompanyName, UserId);
        ExcelBuffer.CloseBook();
        ExcelBuffer.OpenExcel();
    end;

    var
        ExcelBuffer: Record "Excel Buffer";
}