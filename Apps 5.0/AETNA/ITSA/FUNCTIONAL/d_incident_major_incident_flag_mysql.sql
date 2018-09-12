SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM  
(Select Count(1) AS CNT 
FROM  aetna_mdwdb.d_incident a 
RIGHT JOIN aetna_mdsdb.incident_final b ON a.row_id = b.sys_id and a.source_id = b.sourceinstance 
where a.soft_deleted_flag='N'
AND a.major_incident_flag <> case when b.priority in (1,2) then 'Y' else 'N' end )
temp;