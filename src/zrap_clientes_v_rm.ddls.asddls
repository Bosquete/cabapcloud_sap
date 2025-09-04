@EndUserText.label: 'vista rap de clientes'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity zrap_clientes_v_rm as select from zrap_clientes_rm
{
    

  key kunnr,
      land1,
      name1
}
    
