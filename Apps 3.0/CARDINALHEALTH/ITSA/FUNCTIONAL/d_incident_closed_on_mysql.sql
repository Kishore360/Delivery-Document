SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.closed_on' ELSE 'SUCCESS' END as Message
FROM cardinalhealth_mdsdb.incident_final SRC
 LEFT JOIN cardinalhealth_mdwdb.d_lov_map L
 ON (SRC.state=L.dimension_code
 AND SRC.sourceinstance=L.source_id AND L.dimension_class = 'STATE~INCIDENT' )
 LEFT JOIN cardinalhealth_mdwdb.d_incident TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
WHERE  convert_tz(COALESCE( SRC.closed_at,SRC.sys_updated_on),'GMT','America/New_York') 
 <> TRGT.closed_on