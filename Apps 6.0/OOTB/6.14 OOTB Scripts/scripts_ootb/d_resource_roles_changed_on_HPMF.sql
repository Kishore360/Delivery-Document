SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_resource_roles.changed_on' ELSE 'SUCCESS' END as Message
from (select *from  #MDS_TABLE_SCHEMA.hp_rsc_roles_nls_final where cdctype<>'D') SRC
left join  #DWH_TABLE_SCHEMA.d_resource_role TRGT
on SRC.ROLE_ID=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where coalesce(CONVERT_TZ(SRC.LAST_UPDATE_DATE,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'')<>coalesce(TRGT.changed_on,'')