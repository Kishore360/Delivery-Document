SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_case.open_to_resolve_duration' ELSE 'SUCCESS' END as Message
FROM watson_mdwdb.f_case TRGT
LEFT JOIN watson_mdwdb.d_lov_map LM
 ON (TRGT.state_src_key=LM.src_key
 AND TRGT.source_id=LM.source_id AND LM.dimension_class = 'STATE~CASE')
WHERE COALESCE(case when TRGT.opened_on <= TRGT.last_resolved_on 
then TIMESTAMPDIFF(SECOND, convert_tz(TRGT.opened_on, 'GMT','America/New_York'), convert_tz(TRGT.last_resolved_on, 'GMT','America/New_York'))
else null end,'')
<> COALESCE(TRGT.open_to_resolve_duration ,'')