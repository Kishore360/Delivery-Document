SELECT CASE WHEN CNT> 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for incident.u_category' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) AS CNT 
FROM (select * from pdchs_mdsdb.cmdb_rel_ci_final where CDCTYPE<>'D') a 
JOIN pdchs_mdwdb.f_cmdb_relationship_c c ON a.sys_id=c.row_id AND a.sourceinstance=c.source_id
JOIN pdchs_mdwdb.d_configuration_type_c d 
ON COALESCE(UPPER(a.`type`),'UNSPECIFIED')=d.row_id 
AND a.sourceinstance=d.source_id
WHERE COALESCE(d.row_key,CASE WHEN a.`type` IS NULL THEN 0 ELSE -1 END)<>c.configuration_type_c_key
) temp;