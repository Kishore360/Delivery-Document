SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_monitor.location_name' ELSE 'SUCCESS' END as Message

 from (select *, max(name) name1  from #MDS_TABLE_SCHEMA.synthetic_location_detail_final group by name ) SRC
left join #DWH_TABLE_SCHEMA.d_location TRGT
on SRC.name =TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where coalesce(SRC.name1,'')<>coalesce(TRGT.location_name,'');