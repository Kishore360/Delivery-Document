
select  CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_case.open_to_resolve_duration' ELSE 'SUCCESS' END as Message

 from 
 watson_mdwdb.f_case f
LEFT JOIN watson_mdwdb.d_case d on f.case_key=d.row_key 
LEFT JOIN watson_mdwdb.d_lov_map LM
 ON (f.state_src_key=LM.src_key
 AND f.source_id=LM.source_id AND LM.dimension_class = 'STATE~CASE')
where  f.open_to_close_duration<>TIMESTAMPDIFF(SECOND,CONVERT_TZ(d.opened_on,'UTC','GMT'),CONVERT_TZ(d.closed_on,'UTC','GMT')) 