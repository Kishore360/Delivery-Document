SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.overdue_flag' ELSE 'SUCCESS' END as Message
 from #STG_TABLE_SCHEMA.workitem_temp_azure SRC
 
 LEFT JOIN (
 select source_id,max(lastupdated) as lastupdated from  #DWH_TABLE_SCHEMA.d_o_data_freshness
 group by source_id
 ) FRESH  
 ON(FRESH.source_id=SRC.sourceinstance)
 
 left join #DWH_TABLE_SCHEMA.d_work_item TRGT
 on concat(SRC.__numerify__primary_key, '')=TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id
 
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM~',UPPER(SRC.state))=LM.src_rowid  AND SRC.sourceinstance=LM.source_id

 where coalesce(
 CASE WHEN (LM.dimension_wh_code  IN ('PROPOSED','IN PROGRESS') and coalesce(TRGT.DUE_ON,0) < FRESH.lastupdated and TRGT.DUE_ON is not null) THEN 'Y' ELSE 'N' END,'N') <> coalesce(TRGT.overdue_flag ,'')