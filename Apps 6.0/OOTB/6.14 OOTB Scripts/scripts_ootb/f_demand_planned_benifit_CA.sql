
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_demand.PLANNED_BENIFIT' ELSE 'SUCCESS' END as Message
from  (select * from #MDS_TABLE_SCHEMA.inv_investments_final where odf_object_code = 'idea') SRC
left join
 (select * from #MDS_TABLE_SCHEMA.odf_object_instance_mapping_final where PRIMARY_OBJECT_INSTANCE_CODE='idea' and SECONDARY_OBJECT_INSTANCE_CODE='financials') odf
on SRC.id = odf.primary_object_instance_id

left JOIN (select * from #MDS_TABLE_SCHEMA.fin_financials_final )SRC2
on odf.secondary_object_instance_id=SRC2.id 

left join #DWH_TABLE_SCHEMA.f_demand TRGT
on SRC.ID =TRGT.row_id and SRC.sourceinstance=TRGT.source_id
where COALESCE(SRC2.PLANNED_BEN_TOTAL,0)<>coalesce(TRGT.PLANNED_BENIFIT,0)