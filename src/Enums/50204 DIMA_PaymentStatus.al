enum 50204 "DIMA Payment Status"
{
    Extensible = true;
    Caption = 'Payment Status';

    value(0; " ")
    {
        Caption = ' ';
    }
    value(1; Paid)
    {
        Caption = 'Paid';
    }
    value(2; Pending)
    {
        Caption = 'Pending';
    }
    value(3; WFD)
    {
        Caption = 'WFD';
    }
}