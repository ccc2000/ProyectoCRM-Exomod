enum 50203 "DIMA Transaction CORCs Status"
{
    Extensible = true;
    Caption = 'Transaction CORCs Status';

    value(0; " ")
    {
        Caption = ' ';
    }
    value(1; Delivered)
    {
        Caption = 'Delivered';
    }
    value(2; Projected)
    {
        Caption = 'Projected';
    }
}