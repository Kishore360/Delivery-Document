SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_case.last_resolved_on' ELSE 'SUCCESS' END as Message
 FROM watson_mdwdb.d_case TRGT
left join
(
select D.row_key, D.source_id, max(FCA.created_on) resolved_on
FROM watson_mdwdb.d_case D 
LEFT JOIN watson_mdwdb.d_lov_map  LM
 ON LM.src_key = D.state_src_key
 and LM.dimension_wh_code in ('RESOLVED','CLOSED') 
 and LM.dimension_class = 'STATE~CASE'
left join watson_mdwdb.f_case_activity FCA
 on D.row_key = FCA.case_key
 and FCA.source_id=D.source_id
left join watson_mdwdb.d_lov_map  LOVMAP
 on FCA.task_attribute_wh_new_value_key = LOVMAP.src_key
 and FCA.source_id = LOVMAP.source_id
 and LOVMAP.dimension_class = 'STATE~CASE'
where LOVMAP.dimension_wh_code = 'RESOLVED'
group by D.row_key, D.source_id
)SQ
on TRGT.row_key = SQ.row_key 
and TRGT.source_id = SQ.source_id
 WHERE TRGT.row_key not in (0, -1) and 
SQ.resolved_on <> TRGT.last_resolved_on 
