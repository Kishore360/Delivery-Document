SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_monitor.latitude' ELSE 'SUCCESS' END as Message
 from (select *, max(latitude) latitude1 from #MDS_TABLE_SCHEMA.synthetic_location_detail_final group by name ) SRC
left join #DWH_TABLE_SCHEMA.d_location TRGT
on SRC.name =TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where coalesce(SRC.latitude1,'')<>coalesce(round(TRGT.latitude,5),'');