enum 50205 "DIMA Contract Status"
{
    Extensible = true;
    Caption = 'Estado del Contrato';

    value(0; Undefined)
    {
        Caption = ' ';
    }
    value(1; Fulfilled)
    {
        Caption = 'Fulfilled';
    }
    value(2; Open)
    {
        Caption = 'Open';
    }
}