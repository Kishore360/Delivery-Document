SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_monitor.row_id' ELSE 'SUCCESS' END as Message
	FROM (select * from #MDS_TABLE_SCHEMA.synthetic_monitor_final) SRC
	left join #DWH_TABLE_SCHEMA.d_monitor TRGT
	on SRC.entityId =TRGT.row_id
	and SRC.sourceinstance=TRGT.source_id
	where coalesce(TRGT.row_id,'')<>coalesce(SRC.entityId,'');