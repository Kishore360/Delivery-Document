
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_location.soft_deleted_flag' ELSE 'SUCCESS' END as Message FROM 
(select *  from #MDS_TABLE_SCHEMA.synthetic_location_detail_final where cdctype<>'D' ) SRC
left join #DWH_TABLE_SCHEMA.d_location TRGT
on SRC.name =TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where coalesce(case when SRC.cdctype = 'D' then 'Y' else 'N' end,'')<>coalesce(TRGT.soft_deleted_flag,'');
