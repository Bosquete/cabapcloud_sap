@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Entity 2 WAY'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_I_travel_acloud2_RMR as select from ZTAB_DBASE_RMR
{
    key id as Id,
    first_name as FirstName,
    last_name as LastName,
    email as Email,
    phone_number as PhoneNumber,
    @Semantics.amount.currencyCode : 'CurrencyCode'
    salary as Salary,
    currency_code as CurrencyCode
}
