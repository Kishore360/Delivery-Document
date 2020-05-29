SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_demand.PLANNED_CAPITAL_DOC_COST' ELSE 'SUCCESS' END as Message
FROM (select * from #MDS_TABLE_SCHEMA.inv_investments_final where odf_object_code = 'idea' and cdctype<>'D') SRC
LEFT JOIN(select * from #MDS_TABLE_SCHEMA.odf_object_instance_mapping_final)SRC1
on SRC.id=SRC1.primary_object_instance_id
left join(select * from #MDS_TABLE_SCHEMA.fin_financials_final)SRC2
on SRC1.secondary_object_instance_id=SRC2.id
left join  #DWH_TABLE_SCHEMA.f_demand TRGT
on SRC.ID =TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where coalesce(SRC2.PLANNED_CST_CAPITAL_TOTAL,0)<>round(coalesce(TRGT.PLANNED_CAPITAL_DOC_COST,0),6)