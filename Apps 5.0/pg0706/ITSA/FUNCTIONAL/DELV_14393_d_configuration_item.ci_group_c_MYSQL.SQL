



SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.ci_group_c' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) as CNT 
from png_mdsdb.us_idq_ci_groupings_final a 
LEFT JOIN png_mdsdb.cmdb_ci_final b ON a.CONFIGURATION_ITEM_CI=b.name AND a.sourceinstance=b.sourceinstance
LEFT JOIN png_mdwdb.d_configuration_item c ON b.sys_id=c.row_id AND b.sourceinstance=c.source_id
WHERE a.IDQ_CI_GROUPING<>c.ci_group_c
) temp;


