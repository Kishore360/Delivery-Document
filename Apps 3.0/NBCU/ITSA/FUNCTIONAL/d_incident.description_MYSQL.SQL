SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_incident.description' ELSE 'SUCCESS' END as  Message
FROM 
(
SELECT count(1) as CNT 
FROM nbcu_mdsdb.incident_final a
JOIN nbcu_mdwdb.d_incident b ON a.sys_id=b.row_id and a.sourceinstance=b.source_id
Where COALESCE(a.description,'')<>b.description
) temp;

 