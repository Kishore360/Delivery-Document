SELECT CASE WHEN CNT> 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for incident.u_category' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) AS CNT 
FROM (select * from pdchs_mdsdb.cmdb_ci_final where CDCTYPE<>'D') a 
JOIN pdchs_mdwdb.d_configuration_item c ON a.sys_id=c.row_id AND a.sourceinstance=c.source_id
JOIN pdchs_mdwdb.d_lov d 
ON COALESCE(CONCAT('app_environment_c','~','ci','~',UPPER(a.u_app_environment)),'UNSPECIFIED')=d.row_id 
-- AND a.sourceinstance=d.source_id
WHERE COALESCE(d.row_key,CASE WHEN a.u_app_environment IS NULL THEN 0 ELSE -1 END)<>c.ci_app_environment_c_key
) temp;
