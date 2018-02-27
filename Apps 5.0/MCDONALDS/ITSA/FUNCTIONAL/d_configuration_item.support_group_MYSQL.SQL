
SELECT 
CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_configuration_item.support_group' ELSE 'SUCCESS' END as Message
from (select count(1) cnt 
FROM mcdonalds_mdsdb.cmdb_ci_final SRC 
JOIN mcdonalds_mdwdb.d_configuration_item TRGT 
ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id  )
JOIN mcdonalds_mdsdb.sys_user_group_final SRC1 ON SRC.support_group=SRC1.sys_id and SRC.sourceinstance=SRC1.sourceinstance
WHERE  SRC1.name <> (TRGT.support_group))b

 
 