SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_case.last_resolved_on' ELSE 'SUCCESS' END as Message
FROM #DWH_TABLE_SCHEMA.f_case F 
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map  LM
 ON LM.src_key = F.state_src_key
 and LM.dimension_wh_code in ('RESOLVED','CLOSED') 
 and LM.dimension_class = 'STATE~CASE'
 and F.soft_deleted_flag <> 'Y'
LEFT JOIN 
(
select FCA.case_key, LOVMAP.dimension_wh_code, max(FCA.created_on) resolve_date
from #DWH_TABLE_SCHEMA.f_case_activity FCA
left join #DWH_TABLE_SCHEMA.d_lov_map  LOVMAP
on FCA.task_attribute_wh_new_value_key = LOVMAP.src_key
where LOVMAP.dimension_wh_code = 'RESOLVED'
and FCA.soft_deleted_flag <> 'Y'
group by FCA.case_key, LOVMAP.dimension_wh_code
)SQ
on SQ.case_key = F.case_key
where F.last_resolved_on <> SQ.resolve_date
