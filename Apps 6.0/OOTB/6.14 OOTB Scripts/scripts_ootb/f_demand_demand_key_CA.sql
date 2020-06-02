SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_demand.DEMAND_KEY' ELSE 'SUCCESS' END as Message
FROM (select * from #MDS_TABLE_SCHEMA.inv_investments_final where odf_object_code = 'idea' and cdctype<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_demand TRGT
on SRC.ID =TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
left join #DWH_TABLE_SCHEMA.d_demand ic
on COALESCE(SRC.ID,'UNSPECIFIED')=ic.row_id
and SRC.sourceinstance=ic.source_id
where  COALESCE(ic.row_key,case when SRC.ID is Null then 0 else  -1 end)<>COALESCE(TRGT.DEMAND_KEY,'');