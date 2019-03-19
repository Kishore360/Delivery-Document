SELECT CASE WHEN CNT> 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for incident.u_category' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) AS CNT 
FROM (select * from pdchs_mdsdb.cmdb_rel_type_final where CDCTYPE<>'D') a 
JOIN pdchs_mdwdb.d_configuration_type_c c ON a.sys_id=c.row_id AND a.sourceinstance=c.source_id
WHERE a.name<>c.name
) temp;