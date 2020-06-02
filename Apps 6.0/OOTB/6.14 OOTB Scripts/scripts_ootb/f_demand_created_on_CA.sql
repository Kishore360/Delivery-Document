SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_demand.created_on' ELSE 'SUCCESS' END as Message
FROM (select * from #MDS_TABLE_SCHEMA.inv_investments_final where odf_object_code = 'idea' and cdctype<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_demand TRGT
on SRC.ID =TRGT.row_id and SRC.sourceinstance=TRGT.source_id
where coalesce( CONVERT_TZ(SRC.CREATED_DATE,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'')<>coalesce(TRGT.created_on,'')	;

