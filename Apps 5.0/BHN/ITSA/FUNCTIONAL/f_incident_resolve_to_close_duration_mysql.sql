
SELECT SRC.resolved_at, SRC.closed_at,  TRGT.resolve_to_close_duration
 FROM bhn_mdsdb.incident_final SRC
  JOIN bhn_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
  LEFT JOIN bhn_mdwdb.d_lov_map br 
 ON TRGT.state_src_key = br.src_key
WHERE   br.dimension_wh_code IN ( 'CLOSED') and TIMESTAMPDIFF(SECOND,convert_tz(convert_tz( SRC.resolved_at,'GMT','America/Los_Angeles'),
'America/Los_Angeles','GMT'), 
convert_tz(convert_tz(SRC.closed_at,'GMT','America/Los_Angeles'),'America/Los_Angeles','GMT'))
 <> TRGT.resolve_to_close_duration
