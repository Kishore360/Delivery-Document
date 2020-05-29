SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.defect_deferred_flag' ELSE 'SUCCESS' END as Message

FROM #STG_TABLE_SCHEMA.workitem_temp_azure SRC 

left join (
select tmp.issueid,tmp.sourceinstance, count(tmp.issueid) deferred_cn
from #STG_TABLE_SCHEMA.issue_activity_azure_base tmp

left join #DWH_TABLE_SCHEMA.d_lov_map LM_TO
on concat('RESOLUTION~WORK_ITEM~',upper(tmp.to))=LM_TO.src_rowid and tmp.sourceinstance = LM_TO.source_id

where upper(tmp.field) = 'RESOLUTION' and LM_TO.dimension_wh_code in ('DEFERRED')
group by tmp.issueid,tmp.sourceinstance
) deferred_cn
on SRC.__numerify__primary_key=deferred_cn.issueid and SRC.sourceinstance=deferred_cn.sourceinstance

left join #DWH_TABLE_SCHEMA.d_lov_map TYP
on concat('TYPE~WORK_ITEM~',upper(SRC.workItemType))=TYP.src_rowid and SRC.sourceinstance = TYP.source_id
 
LEFT JOIN  #DWH_TABLE_SCHEMA.d_work_item TRGT
on concat(SRC.__numerify__primary_key, '')=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
 
where TRGT.soft_deleted_flag <> 'Y' and 
coalesce(CASE when TYP.dimension_wh_code in ('BUG') and deferred_cn.deferred_cn > 0 then 'Y' ELSE 'N' end,'N' ) <>coalesce(TRGT.defect_deferred_flag,'');