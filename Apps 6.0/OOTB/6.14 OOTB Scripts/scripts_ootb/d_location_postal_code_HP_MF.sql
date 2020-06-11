SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_location.postal_code' ELSE 'SUCCESS' END as Message
 FROM (select * from #MDS_TABLE_SCHEMA.hp_knta_lookups_nls_final  where hp_knta_lookups_nls_final.lookup_type='RSC - Location' and cdctype<>'D') SRC
left join #DWH_TABLE_SCHEMA.d_location TRGT
on TRGT.row_id=SRC.lookup_code
AND SRC.SOURCEINSTANCE=TRGT.SOURCE_ID
 where COALESCE(TRGT.postal_code,'') <> '';