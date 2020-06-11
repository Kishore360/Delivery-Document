 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_demand.row_id' ELSE 'SUCCESS' END as Message
 FROM (select * from #MDS_TABLE_SCHEMA.hp_knta_lookups_nls_final  where lookup_type='RSC - Location' and cdctype<>'D') SRC
left join #DWH_TABLE_SCHEMA.d_location TRGT
on TRGT.row_id=SRC.lookup_code
AND SRC.SOURCEINSTANCE=TRGT.SOURCE_ID
 where COALESCE(TRGT.row_id,'')<>COALESCE(SRC.lookup_code,'');