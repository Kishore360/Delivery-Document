
select 
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_case.resolve_to_close_duration' ELSE 'SUCCESS' END as Message
 from 
 ibmwatson_mdwdb.f_case f
LEFT JOIN ibmwatson_mdwdb.d_case d on f.case_key=d.row_key 
LEFT JOIN ibmwatson_mdwdb.d_lov_map LM
 ON (f.state_src_key=LM.src_key
 AND f.source_id=LM.source_id AND LM.dimension_class = 'STATE~CASE')
where  f.resolve_to_close_duration<>TIMESTAMPDIFF(SECOND,CONVERT_TZ(d.last_resolved_on,'UTC','GMT'),CONVERT_TZ(d.closed_on,'UTC','GMT')) 
