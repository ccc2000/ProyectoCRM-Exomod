
table 50202 "DIMA CORC Report Details"
{
    Caption = 'DIMA Detalles de Reporte CORCs';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Contract Entry No."; Integer)
        {
            Caption = 'Contract Entry No.';
        }
        field(2; "Sort Order"; Integer)
        {
            Caption = 'Sort Order';
        }
        field(3; "Source Type"; Option)
        {
            Caption = 'Source Type';
            OptionMembers = History,Shipment;
            OptionCaption = 'Historial,Remisión';
        }
        field(4; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(5; "Transaction Id"; Text[50])
        {
            Caption = 'Transaction Id';
        }
        field(6; "Client Id"; Text[50])
        {
            Caption = 'Client Id';
        }
        field(7; FY; Text[20])
        {
            Caption = 'FY';
        }
        field(8; "FY Payment Month"; Enum "DIMA Payment Months")
        {
            Caption = 'FY Payment Month';
        }
        field(9; Facility; Text[100])
        {
            Caption = 'Facility';
        }
        field(10; "Facility Id"; Code[20])
        {
            Caption = 'Facility ID';
            TableRelation = "Location".Code;
            trigger OnValidate()
            var
                Location: Record "Location";
            begin
                "Facility" := '';

                if "Facility Id" = '' then
                    exit;

                if Location.Get("Facility Id") then
                    "Facility" := Location.Name;
            end;
        }
        field(11; "Transaction Date"; Date)
        {
            Caption = 'Transaction Date';
        }
        field(12; "Payment Date"; Date)
        {
            Caption = 'Payment Date';
        }
        field(13; "Expected Payment Date"; Date)
        {
            Caption = 'Expected Payment Date';
        }
        field(14; "Account Holder"; Text[100])
        {
            Caption = 'Account Holder';
        }
        field(15; "Second Broker"; Text[100])
        {
            Caption = 'Second Broker';
        }
        field(16; "End Client"; Text[100])
        {
            Caption = 'End Client';
        }
        field(17; Volume; Decimal)
        {
            Caption = 'Volume';
        }
        field(18; "Invoice Amount"; Decimal)
        {
            Caption = 'Invoice Amount';
        }
        field(19; "Open Balance"; Decimal)
        {
            Caption = 'Open Balance';
        }
        field(20; Price; Decimal)
        {
            Caption = 'Price';
        }
        field(21; Status; Enum "DIMA Transaction CORCs Status")
        {
            Caption = 'Status';
        }
        field(22; "Payment Status"; Enum "DIMA Payment Status")
        {
            Caption = 'Payment Status';
        }
        field(23; "Contract ID"; Code[50])
        {
            Caption = 'Contract ID';
        }
        field(24; Invoice; Text[50])
        {
            Caption = 'Invoice';
        }
        field(25; Type; Text[30])
        {
            Caption = 'Type';
        }
        field(26; Comments; Text[250])
        {
            Caption = 'Comments';
        }
        field(27; "Facility Print"; Text[100])
        {
            Caption = 'Facility Print';
        }
    }

    keys
    {
        key(PK; "Contract Entry No.", "Sort Order", "Entry No.")
        {
            Clustered = true;
        }
    }
}
