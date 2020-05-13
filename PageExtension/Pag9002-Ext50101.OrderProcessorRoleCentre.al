pageextension 50101 Pageextension50101 extends "Order Processor Role Center"
{
    actions
    {
        addlast(Sections)
        {
            group(IE_StudentSection)
            {
                Caption = 'Student Section';
                action(IE_StudentList)
                {
                    Caption = 'Students';
                    RunObject = page IE_StudentList;
                    ApplicationArea = All;
                }
            }
        }
    }
}