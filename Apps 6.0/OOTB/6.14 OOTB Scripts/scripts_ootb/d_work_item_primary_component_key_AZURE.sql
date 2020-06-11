SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.primary_component_key' ELSE 'SUCCESS' END as Message
 FROM #STG_TABLE_SCHEMA.workitem_temp_azure SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_work_item TRGT 
 ON (concat(SRC.__numerify__primary_key, '')=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id)
/*LEFT JOIN 
(
select comp_cnt.issueid, comp_cnt.sourceinstance, count(comp_cnt.id) comp_no, min(comp_cnt.id) comp_id
from #MDS_TABLE_SCHEMA.issue_components_final comp_cnt
group by comp_cnt.issueid, comp_cnt.sourceinstance
) issue_comp_many
on issue_comp_many.issueid = SRC.__numerify__primary_key and issue_comp_many.sourceinstance = SRC.sourceinstance
LEFT JOIN #DWH_TABLE_SCHEMA.d_component LKP 
on LKP.row_id = issue_comp_many.comp_id and issue_comp_many.sourceinstance=LKP.source_id
WHERE COALESCE(case 
when issue_comp_many.comp_no > 1 then -2 
when issue_comp_many.comp_no = 0 then 0 
when issue_comp_many.comp_no = 1 and LKP.row_key is null then -1 
when issue_comp_many.comp_no = 1 then LKP.row_key 
end, 0)*/
where COALESCE(null, 0) <> COALESCE(TRGT.primary_component_key ,''); 