SELECT CASE
           WHEN count(1) > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN count(1) >0 THEN 'Failure'
           ELSE 'Data Matched'
       END AS Message
FROM pgi_mdsdb.incident_final a
INNER JOIN pgi_mdwdb.f_incident b ON a.sys_id=b.row_id
AND a.sourceinstance=b.source_id
INNER JOIN pgi_mdwdb.d_lov_map c ON c.dimension_class ='STATE~INCIDENT'
AND a.sourceinstance=c.source_id
AND c.dimension_code = a.state
AND c.dimension_wh_code IN('RESOLVED','CLOSED')
LEFT JOIN pgi_mdwdb.d_calendar_date d ON  d.row_id=COALESCE(DATE_FORMAT(CONVERT_TZ(a.u_resolved,'GMT','UTC'),'%Y%m%d'),'UNSPECIFIED')
WHERE COALESCE(d.row_key,coalesce(b.closed_on_key,0)) <> b.last_resolved_on_key;