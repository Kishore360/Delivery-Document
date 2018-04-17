
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_incident.closed_first_pass_c_flag' ELSE 'SUCCESS' END as  Message
FROM 
(SELECT count(1) as CNT 
FROM tjx_mdsdb.incident_final src
JOIN tjx_mdwdb.d_incident trgt ON src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
WHERE if(src.u_closed_first_pass=TRUE,'Y','N')<>trgt.closed_first_pass_c_flag limit 100
)temp;