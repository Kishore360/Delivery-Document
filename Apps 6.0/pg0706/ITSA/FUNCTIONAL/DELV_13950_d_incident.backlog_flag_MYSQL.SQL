SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_incident.backlog_flag' ELSE 'SUCCESS' END as Message
FROM 
( SELECT 
Count(1) as CNT
FROM png_mdsdb.incident_final SRC 
LEFT JOIN png_mdwdb.d_incident TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN png_mdwdb.f_incident FA ON (TRGT.row_key=FA.incident_key AND TRGT.source_id=FA.source_id)
JOIN png_mdwdb.d_lov LKP ON (CONCAT('STATE~INCIDENT~',SRC.state))=LKP.row_id AND SRC.sourceinstance=LKP.source_id
JOIN png_mdwdb.d_lov_map LM ON FA.state_src_key=LM.src_key
JOIN (Select x.source_id,max(x.lastupdated) as Lastupdated 
FROM png_workdb.o_data_freshness x  group by source_id) da ON (SRC.sourceinstance=da.source_id)
WHERE 
CASE WHEN LM.dimension_wh_code='OPEN' AND (DATEDIFF(da.lastupdated,TRGT.opened_on)+1) > 30 THEN 'Y' ELSE 'N' END<>TRGT.backlog_flag
) temp;



