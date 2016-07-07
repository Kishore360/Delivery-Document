SELECT CASE
           WHEN count(1) > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN count(1) >0 THEN 'Failure'
           ELSE 'Data Matched'
       END AS Message
FROM ucsf_mdsdb.incident_final a
INNER JOIN ucsf_mdwdb.f_incident b ON a.sys_id=b.row_id
AND a.sourceinstance=b.source_id
INNER JOIN ucsf_mdwdb.d_lov_map c ON c.dimension_class ='STATE~INCIDENT'
AND a.sourceinstance=c.source_id
AND c.dimension_code = a.state
AND c.dimension_wh_code IN('RESOLVED','CLOSED')
LEFT JOIN ucsf_mdwdb.d_calendar_date d ON a.sourceinstance=d.source_id
AND d.row_id=DATE_FORMAT(CONVERT_TZ(a.closed_at,'GMT','America/LosAngeles'),'%Y%m%d')
WHERE COALESCE(d.row_key,coalesce(b.closed_on_key,c.row_key)) <> b.last_resolved_on_key;


