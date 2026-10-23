/*
page 50110 "EXM Clean Test Data"
{
    Caption = 'Vaciar Datos de Prueba';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(Info)
            {
                Caption = 'Información';
                field(Advertencia; AdvertenciaText)
                {
                    ApplicationArea = All;
                    Caption = '';
                    Editable = false;
                    Style = Attention;
                }
            }
            group(Seleccion)
            {
                Caption = 'Tablas a vaciar';
                field(VentasAbiertas; LimpiarVentasAbiertas)
                {
                    ApplicationArea = All;
                    Caption = 'Ventas abiertas (36, 37)';
                }
                field(FacturasContabilizadas; LimpiarFacturas)
                {
                    ApplicationArea = All;
                    Caption = 'Facturas contabilizadas (112, 113, 114, 115)';
                }
                field(MovClientes; LimpiarMovClientes)
                {
                    ApplicationArea = All;
                    Caption = 'Movimientos de cliente (21, 379)';
                }
                field(Inventario; LimpiarInventario)
                {
                    ApplicationArea = All;
                    Caption = 'Inventario (32, 5802)';
                }
                field(Contabilidad; LimpiarContabilidad)
                {
                    ApplicationArea = All;
                    Caption = 'Contabilidad (17, 45, 254)';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Ejecutar)
            {
                ApplicationArea = All;
                Caption = 'Vaciar tablas seleccionadas';
                Image = Delete;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    CleanCU: Codeunit "EXM Clean Test Data";
                begin
                    if not Confirm('¿Estás seguro? Esta acción no se puede deshacer.') then
                        exit;
                    CleanCU.Run();
                end;
            }
        }
    }

    var
        AdvertenciaText: Text;
        LimpiarVentasAbiertas: Boolean;
        LimpiarFacturas: Boolean;
        LimpiarMovClientes: Boolean;
        LimpiarInventario: Boolean;
        LimpiarContabilidad: Boolean;

    trigger OnOpenPage()
    begin
        AdvertenciaText := '⚠ SOLO USAR EN SANDBOX. Esta acción borra datos permanentemente.';
        LimpiarVentasAbiertas := true;
        LimpiarFacturas := true;
        LimpiarMovClientes := true;
        LimpiarInventario := true;
        LimpiarContabilidad := true;
    end;
}

*/