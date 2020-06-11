SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_work_item.reopened_date' ELSE 'SUCCESS' END as Message
from (select * from  #STG_TABLE_SCHEMA.workitem_temp_azure  where cdctype<>'D') SRC

left join (
select tmp.issueid,tmp.sourceinstance, max(tmp.created) as reopened_date
from #STG_TABLE_SCHEMA.issue_activity_azure_base tmp
 
left join #DWH_TABLE_SCHEMA.d_lov_map LM_TO
on concat('STATUS~WORK_ITEM~',upper(tmp.to))=LM_TO.src_rowid and tmp.sourceinstance = LM_TO.source_id

left join #DWH_TABLE_SCHEMA.d_lov_map LM_FROM
on concat('STATUS~WORK_ITEM~',upper(tmp.from))=LM_FROM.src_rowid and tmp.sourceinstance = LM_FROM.source_id
 
where lower(tmp.field) = 'status' and LM_FROM.dimension_wh_code in ('COMPLETED','RESOLVED','CANCELLED') and LM_TO.dimension_wh_code in ('PROPOSED', 'IN PROGRESS')

group by tmp.issueid,tmp.sourceinstance
) reopen_dt
on SRC.__numerify__primary_key=reopen_dt.issueid and SRC.sourceinstance=reopen_dt.sourceinstance

left join  #DWH_TABLE_SCHEMA.d_work_item TRGT
on SRC.__numerify__primary_key=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id

where COALESCE(convert_tz(reopen_dt.reopened_date, '<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'') <> coalesce(TRGT.reopened_date,'');