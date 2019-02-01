SELECT CASE WHEN CNT> 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for incident.u_category' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) AS CNT 
FROM (select * from pdchs_mdsdb.cmdb_ci_final where CDCTYPE<>'D') a 
JOIN pdchs_mdwdb.d_configuration_item c ON a.sys_id=c.row_id AND a.sourceinstance=c.source_id
JOIN pdchs_mdwdb.d_domain_c d 
ON COALESCE(UPPER(a.sys_domain),'UNSPECIFIED')=d.row_id 
AND a.sourceinstance=d.source_id
WHERE COALESCE(d.row_key,CASE WHEN a.sys_domain IS NULL THEN 0 ELSE -1 END)<>c.domain_c_key
) temp;
