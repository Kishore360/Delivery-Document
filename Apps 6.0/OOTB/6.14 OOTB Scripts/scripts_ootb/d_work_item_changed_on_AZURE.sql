SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_work_item.changed_on' ELSE 'SUCCESS' END as Message
from (select * from  #STG_TABLE_SCHEMA.workitem_temp_azure  where cdctype<>'D') SRC
left join  #DWH_TABLE_SCHEMA.d_work_item TRGT
on concat(SRC.__numerify__primary_key,'')=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where COALESCE(convert_tz(SRC.changedDate,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'')
<>coalesce(TRGT.changed_on,'');