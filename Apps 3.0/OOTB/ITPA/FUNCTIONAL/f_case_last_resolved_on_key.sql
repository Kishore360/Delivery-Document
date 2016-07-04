SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_case.last_resolved_on_key' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdwdb.f_case TRGT
left join
(
select F.row_key, F.source_id, max(FCA.created_on) resolved_on
FROM <<tenant>>_mdwdb.f_case F 
LEFT JOIN <<tenant>>_mdwdb.d_lov_map  LM
 ON LM.src_key = F.state_src_key
 and LM.dimension_wh_code in ('RESOLVED','CLOSED') 
 and LM.dimension_class = 'STATE~CASE'
left join <<tenant>>_mdwdb.f_case_activity FCA
 on F.case_key = FCA.case_key
 and FCA.source_id=F.source_id
left join <<tenant>>_mdwdb.d_lov_map  LOVMAP
 on FCA.task_attribute_wh_new_value_key = LOVMAP.src_key
 and FCA.source_id = LOVMAP.source_id
 and LOVMAP.dimension_class = 'STATE~CASE'
where LOVMAP.dimension_wh_code = 'RESOLVED'
group by F.row_key, F.source_id
)SQ
on TRGT.row_key = SQ.row_key 
and TRGT.source_id = SQ.source_id
LEFT JOIN <<tenant>>_mdwdb.d_calendar_date LKP
 on (LKP.row_id  = coalesce(date_format(SQ.resolved_on,'%Y%m%d'),-1) and LKP.source_id=0)
 WHERE coalesce(LKP.row_key, '')  <> COALESCE(TRGT.last_resolved_on_key,'') 
