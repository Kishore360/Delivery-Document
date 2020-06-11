SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_work_item.work_item_board_column_done_flag' ELSE 'SUCCESS' END
 as Message
from (select * from  #STG_TABLE_SCHEMA.workitem_temp_azure  where cdctype<>'D') SRC
left join  #DWH_TABLE_SCHEMA.d_work_item TRGT
on concat(SRC.__numerify__primary_key, '')=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where coalesce(case when SRC.boardColumnDone=1 then 'Y' else 'N' end,'N')<>coalesce(TRGT.work_item_board_column_done_flag,'');