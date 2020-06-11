SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_keyword.source_id' ELSE 'SUCCESS' END as Message
FROM 
(select work_item.row_key as rowkey, work_item.source_id as sourceid , work_item.soft_deleted_flag as soft_delete
from #DWH_TABLE_SCHEMA.d_work_item  work_item  
LEFT JOIN 
#DWH_TABLE_SCHEMA.d_work_item_comments comments
ON work_item.row_id = comments.row_id and work_item.source_id = comments.source_id

) SRC
LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_keyword TRGT
on SRC.rowkey = TRGT.table_row_key and SRC.sourceid = TRGT.source_id
where coalesce(SRC.sourceid, 0) <> COALESCE(TRGT.source_id, 0);
