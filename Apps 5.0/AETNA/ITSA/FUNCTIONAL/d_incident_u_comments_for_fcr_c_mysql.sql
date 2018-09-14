SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM 
( 
SELECT Count(1) AS CNT 
FROM  aetna_mdwdb.d_incident a 
JOIN aetna_mdsdb.incident_final b
ON a.row_id = b.sys_id and a.source_id = b.sourceinstance 
where a.soft_deleted_flag='N'
AND b.u_comments_for_fcr <> a.u_comments_for_fcr_c
) temp;
