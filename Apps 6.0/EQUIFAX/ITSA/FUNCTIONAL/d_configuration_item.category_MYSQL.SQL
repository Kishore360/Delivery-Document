SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.category' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT count(1) as CNT 
FROM equifax_mdsdb.cmdb_ci_final a 
LEFT JOIN equifax_mdwdb.d_configuration_item b ON (a.sys_id=b.row_id and a.sourceinstance=b.source_id)
JOIN equifax_mdsdb.sys_choice_final lkp
on (a.sys_id=lkp.name)
WHERE COALESCE(lkp.name,'UNSPECIFIED')<>b.category and a.cdctype<>'D'
) temp;