Enum 50205 "DIMA Transaction Type"
{
    Extensible = true;
    Caption = 'Transaction Type';

    value(0; " ")
    {
        Caption = ' ';
    }
    value(1; Spot)
    {
        Caption = 'Spot';
    }
    value(2; Offtake)
    {
        Caption = 'Offtake';
    }
    value(3; Prepayment)
    {
        Caption = 'Prepayment';
    }
    value(4; "Profit Sharing")
    {
        Caption = 'Profit Sharing';
    }
    value(5; "Donation")
    {
        Caption = 'Donation';
    }
}




