SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item.project_key' ELSE 'SUCCESS' END as Message
 
 from (select * from  #STG_TABLE_SCHEMA.workitem_temp_azure where cdctype <> 'D') SRC
 
 left join #DWH_TABLE_SCHEMA.d_project LKP
 on SRC.projectKey=LKP.row_id
 and SRC.sourceinstance=LKP.source_id
 
 left join #DWH_TABLE_SCHEMA.f_work_item TRGT
 on concat(SRC.__numerify__primary_key, '')=TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id
 
 where coalesce(LKP.row_key,case when SRC.projectKey is null then 0 else -1 end )<>coalesce(TRGT.project_key,'')