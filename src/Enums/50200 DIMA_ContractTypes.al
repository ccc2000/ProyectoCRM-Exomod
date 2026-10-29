enum 50200 "DIMA Contract Type"
{
    Extensible = true;
    Caption = 'Tipo de Contrato';

    value(0; Undefined)
    {
        Caption = ' ';
        // Opción sin tipo de contrato
    }
    value(1; Spot)
    {
        Caption = 'Spot';
    }
    value(2; Offtake)
    {
        Caption = 'Offtake';
    }
}