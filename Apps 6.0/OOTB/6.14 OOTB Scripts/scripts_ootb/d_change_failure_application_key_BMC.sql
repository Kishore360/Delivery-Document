SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.application_key' ELSE 'SUCCESS' END as Message
FROM (select * from #DWH_TABLE_SCHEMA.d_change_failure where current_flag='Y' and row_key not in (0,-1))TGT
left join (
select chg_assoc.request_id02, chg_assoc.sourceinstance, min(request_id01) as latest_ci
from  #MDS_TABLE_SCHEMA.hlx_chg_associations_final chg_assoc 
join(select chg_assoc.request_id02, chg_assoc.sourceinstance, min(chg_assoc.submit_date) as latest_date, assoc_type.enumId 
from  #MDS_TABLE_SCHEMA.hlx_chg_associations_final chg_assoc
join (SELECT enum_values.value,enum_values.enumId, enum_values.sourceinstance
FROM  #MDS_TABLE_SCHEMA.hlx_field_enum_values_final enum_values
JOIN  #MDS_TABLE_SCHEMA.hlx_field_final field ON (enum_values.fieldId=field.fieldId AND enum_values.schemaId=field.schemaId and enum_values.sourceinstance = field.sourceinstance)
JOIN  #MDS_TABLE_SCHEMA.hlx_arschema_final schma ON (field.schemaId=schma.schema_Id and field.sourceinstance = schma.sourceinstance and schma.overlaygroup=0) where field.fieldName ='Association Type01' AND schma.NAME='CHG:Associations' AND enum_values.value = 'Related To'
) assoc_type
on chg_assoc.association_type01 = assoc_type.enumId and chg_assoc.sourceinstance = assoc_type.sourceinstance

join (SELECT enum_values.value,enum_values.enumId, enum_values.sourceinstance
FROM  #MDS_TABLE_SCHEMA.hlx_field_enum_values_final enum_values
JOIN  #MDS_TABLE_SCHEMA.hlx_field_final field ON (enum_values.fieldId=field.fieldId AND enum_values.schemaId=field.schemaId and enum_values.sourceinstance = field.sourceinstance)
JOIN  #MDS_TABLE_SCHEMA.hlx_arschema_final schma ON (field.schemaId=schma.schema_Id and field.sourceinstance = schma.sourceinstance and schma.overlaygroup=0 ) where field.fieldName ='Request Type01' AND schma.NAME='CHG:Associations' and enum_values.value = 'Application') req_type 
on chg_assoc.request_type01 = req_type.enumId and chg_assoc.sourceinstance = req_type.sourceinstance

where chg_assoc.data_set_id01 = 'BMC.ASSET' 
group by chg_assoc.request_id02, chg_assoc.sourceinstance,enumId
)SRC

on SRC.request_id02=chg_assoc.request_id02
and SRC.sourceinstance=chg_assoc.sourceinstance
and SRC.latest_date=chg_assoc.submit_date

group by chg_assoc.request_id02, chg_assoc.sourceinstance)base
on TGT.row_id = base.request_id02 and TGT.source_id = base.sourceinstance


left join  #MDS_TABLE_SCHEMA.hlx_bmc_core_baseelement_final lkp_ci 
on base.latest_ci = lkp_ci.reconciliationidentity and base.sourceinstance = lkp_ci.sourceinstance 
and lkp_ci.datasetid = 'BMC.ASSET'

left join  #MDS_TABLE_SCHEMA.hlx_bmc_core_application_final lkp_application_ci
on base.latest_ci = lkp_application_ci.reconciliationidentity 
and base.sourceinstance = lkp_application_ci.sourceinstance and lkp_application_ci.datasetid = 'BMC.ASSET'

left join #DWH_TABLE_SCHEMA.d_application lkp_d_application
on coalesce(concat('Application~',lkp_application_ci.requestid),'UNSPECIFIED') = lkp_d_application.row_id

WHERE COALESCE(lkp_d_application.row_key,CASE WHEN lkp_application_ci.requestid IS NULL THEN 0 else '-1' end)<> COALESCE(TGT.application_key,'')