permissionset 50200 "DIMA CORC"
{
    Assignable = true;
    Caption = 'DIMA CORC';

    Permissions =
        tabledata "DIMA CORC Report Details" = RIMD,
        tabledata "DIMA Hist. de Transacciones" = RIMD,
        tabledata "DIMA Contratos CORCs" = RIMD,
        table "DIMA Contratos CORCs" = X,
        table "DIMA Hist. de Transacciones" = X,
        table "DIMA CORC Report Details" = X,
        page "DIMA Hist. de Transacciones" = X,
        page "DIMA Contratos CORCs" = X;
}