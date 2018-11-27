SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.ci_type_c' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) as CNT 
from pandg_mdsdb.us_idq_ci_groupings_final a 
LEFT JOIN pandg_mdsdb.cmdb_ci_final b ON a.CONFIGURATION_ITEM_CI=b.name AND a.sourceinstance=b.sourceinstance
LEFT JOIN pandg_mdwdb.d_configuration_item c ON b.sys_id=c.row_id AND b.sourceinstance=c.source_id
WHERE a.IDQ_ORGANIZATION_CI_OWNERSHIP<>c.ci_type_c
) temp;


