SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_demand.demand_requestor_key' ELSE 'SUCCESS' END as Message
FROM (select * from #MDS_TABLE_SCHEMA.inv_investments_final where odf_object_code = 'idea' and cdctype<>'D') SRC
left join(select * from #MDS_TABLE_SCHEMA.inv_ideas_final)SRC1
on SRC.id=SRC1.id
left join  #DWH_TABLE_SCHEMA.f_demand TRGT
on SRC.ID =TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
left join  #DWH_TABLE_SCHEMA.d_internal_contact ic
on COALESCE(CONCAT('INTERNAL_CONTACT~',SRC1.INITIATOR_ID),'UNSPECIFIED')=ic.row_id
and SRC.sourceinstance=ic.source_id
where  COALESCE(ic.row_key,case when SRC1.INITIATOR_ID is Null then 0 else -1 end)<>COALESCE(TRGT.DEMAND_REQUESTOR_KEY,'0')