table 50200 "EXM Transaction History"
{
    Caption = 'Transaction History';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
        }
        field(2; "Transaction Id"; Code[20])
        {
            Caption = 'Transaction ID';
        }
        field(3; "Client Id"; Code[20])
        {
            Caption = 'Client ID';
        }
        field(4; "FY"; Integer)
        {
            Caption = 'Fiscal Year';
        }
        field(5; "FY Payment Month"; Text[20])
        {
            Caption = 'FY Payment Month';
        }
        field(6; "Facility"; Text[50])
        {
            Caption = 'Facility';
        }
        field(7; "Facility Id"; Integer)
        {
            Caption = 'Facility ID';
        }
        field(8; "Transaction Date"; Date)
        {
            Caption = 'Transaction Date';
        }
        field(9; "Payment Date"; Date)
        {
            Caption = 'Payment Date';
        }
        field(10; "Expected Payment Date"; Date)
        {
            Caption = 'Expected Payment Date';
        }
        field(11; "Account Holder"; Text[100])
        {
            Caption = 'Account Holder';
        }
        field(12; "Second Broker"; Text[100])
        {
            Caption = 'Second Broker';
        }
        field(13; "End Client"; Text[100])
        {
            Caption = 'End Client';
        }
        field(14; "Volume"; Decimal)
        {
            Caption = 'Volume (CORCs)';
            AutoFormatType = 0;
        }
        field(15; "Invoice Amount"; Decimal)
        {
            Caption = 'Invoice Amount (USD)';
            AutoFormatType = 0;
        }
        field(16; "Open Balance"; Decimal)
        {
            Caption = 'Open Balance (USD)';
            AutoFormatType = 0;
        }
        field(17; "Price"; Decimal)
        {
            Caption = 'Price (USD/CORC)';
            AutoFormatType = 0;
        }
        field(18; "Status"; Text[30])
        {
            Caption = 'Status';
        }
        field(19; "Payment Status"; Text[30])
        {
            Caption = 'Payment Status';
        }
        field(20; "Contract ID"; Code[20])
        {
            Caption = 'Contract ID';
        }
        field(21; "Invoice"; Code[20])
        {
            Caption = 'Invoice No.';
        }
        field(22; "Type"; Text[30])
        {
            Caption = 'Type';
        }
        field(23; "Comments"; Text[250])
        {
            Caption = 'Comments';
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}