SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.change_caused_incident_c_flag' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT count(1) as CNT  
FROM png_mdsdb.change_request_final a 
JOIN 
(SELECT x.sys_id,x.sourceinstance,CASE WHEN b.caused_by IS NULL THEN 'N' ELSE 'Y' END as Source_flag
FROM png_mdsdb.incident_final x ) b ON a.sys_id=b.caused_by AND a.sourceinstance =b.sourceinstance
JOIN png_mdwdb.d_change_request c ON a.sys_id and c.row_id and a.sourceinstance=c.source_id
CASE WHEN b.caused_by IS NULL THEN 'N' ELSE 'Y' END as Source_flag,c.change_caused_incident_c_flag
) temp;


