table 50100 IE_Student
{
    Caption = 'Student';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Student ID"; Code[10])
        {
            Caption = 'Student ID';
            DataClassification = CustomerContent;
        }
        field(2; "Student First Name"; Text[50])
        {
            Caption = 'Student First Name';
            DataClassification = CustomerContent;
        }
        field(3; "Student Last Name"; Text[50])
        {
            Caption = 'Student Last Name';
            DataClassification = CustomerContent;
        }
        field(4; "Student Email ID"; Text[250])
        {
            Caption = 'Student Email ID';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Student ID")
        {
            Clustered = true;
        }
    }

}
