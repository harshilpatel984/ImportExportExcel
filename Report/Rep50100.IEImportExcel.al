report 50100 IE_ImportExcel
{
    Caption = 'Import Excel';
    ProcessingOnly = true;
    requestpage
    {
        trigger OnQueryClosePage(CloseAction: Action): Boolean
        begin
            if CloseAction = ACTION::OK then begin
                if UploadIntoStream('Upload Excel', '', '', FileName, ReadInstream) then begin
                    if FileName = '' then
                        exit(FALSE);
                    SheetName := ExcelBuffer.SelectSheetsNameStream(ReadInstream);
                    if SheetName = '' then
                        exit(TRUE);
                end;
            end;
        end;
    }
    trigger OnPreReport()
    begin
        ExcelBuffer.LOCKTABLE;
        ExcelBuffer.OpenBookStream(ReadInstream, SheetName);
        ExcelBuffer.ReadSheet;

        GetLastRowNo;

        FOR I := 2 TO TotalRow DO
            InsertData(I);

        ExcelBuffer.DELETEALL;
    end;

    local procedure GetLastRowNo()
    begin
        CLEAR(TotalRow);
        if ExcelBuffer.FINDLAST then
            TotalRow := ExcelBuffer."Row No.";
    end;

    local procedure InsertData(RowNo: Integer)
    var
        Student: Record IE_Student;
    begin
        Student.Init();
        EVALUATE(Student."Student ID", GetValueAtCell(RowNo, 1));
        EVALUATE(Student."Student First Name", GetValueAtCell(RowNo, 2));
        EVALUATE(Student."Student Last Name", GetValueAtCell(RowNo, 3));
        EVALUATE(Student."Student Email ID", GetValueAtCell(RowNo, 4));
        Student.Insert();
    end;

    local procedure GetValueAtCell(RowNo: Integer; ColNo: Integer): Text
    var
        ExcelBuffer1: Record "Excel Buffer";
    begin
        if ExcelBuffer1.GET(RowNo, ColNo) then
            exit(ExcelBuffer1."Cell Value as Text");
    end;

    var
        ExcelBuffer: Record "Excel Buffer";
        ReadInstream: InStream;
        FileName: Text;
        SheetName: Text;
        TotalRow: Integer;
        I: Integer;
}
