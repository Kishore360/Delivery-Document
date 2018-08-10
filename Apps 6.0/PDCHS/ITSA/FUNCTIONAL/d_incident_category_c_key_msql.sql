SELECT CASE WHEN CNT> 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for incident.u_category' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) AS CNT 
FROM (select * from pdchs_mdsdb.incident_final where CDCTYPE<>'D') a 
left JOIN (select * from  pdchs_mdsdb.u_category_final where CDCTYPE<> 'D') b ON a.u_category=b.sys_id AND a.sourceinstance=b.sourceinstance     
JOIN pdchs_mdwdb.d_incident c ON a.sys_id=c.row_id AND a.sourceinstance=c.source_id
JOIN pdchs_mdwdb.d_category_c d ON b.sys_id=d.row_id AND b.sourceinstance=d.source_id
WHERE COALESCE(d.row_key,CASE WHEN a.u_category IS NULL THEN 0 ELSE -1 END)<>c.incident_category_c_key
) temp;