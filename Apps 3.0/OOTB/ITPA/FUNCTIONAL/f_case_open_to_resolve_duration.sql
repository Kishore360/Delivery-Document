SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_case.open_to_resolve_duration' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdwdb.f_case TRGT
LEFT JOIN <<tenant>>_mdwdb.d_lov_map L
 ON (TRGT.state_src_key=L.src_key
 AND TRGT.source_id=L.source_id AND L.dimension_class = 'STATE~CASE' )
WHERE case when L.dimension_wh_code in ('RESOLVED','CLOSED') THEN
		CASE WHEN TRGT.opened_on <= TRGT.last_resolved_on THEN COALESCE( TIMESTAMPDIFF(SECOND, TRGT.opened_on, TRGT.last_resolved_on),'') ELSE '' end
	  else '' end
<> COALESCE(TRGT.open_to_resolve_duration ,'')
