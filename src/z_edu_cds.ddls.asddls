@AbapCatalog.sqlViewName: 'ZSQL_EDU_CDS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Education'
define view Z_EDU_CDS as select from ekko
inner join ekpo on ekko.ebeln = ekpo.ebeln
association [0..1] to mara on mara.matnr = ekpo.matnr
association [0..1] to makt on makt.matnr = ekpo.matnr and makt.spras = $session.system_language
association [0..1] to lfa1 on lfa1.lifnr = ekko.lifnr
{
   key ekpo.ebeln,
   key ekpo.ebelp,
   ekpo.matnr,
   makt.maktx,
   ekpo.werks,
   ekpo.lgort,
   ekpo.meins,
   lfa1.lifnr,
   lfa1.adrnr,
   CONCAT(lfa1.stras, lfa1.mcod3) as Satici_Adresi
}
