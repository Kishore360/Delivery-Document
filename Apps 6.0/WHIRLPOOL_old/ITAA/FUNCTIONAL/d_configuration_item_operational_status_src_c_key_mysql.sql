SELECT 
CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_configuration_item.operational_status_src_c_key' ELSE 'SUCCESS' END as Message
from (select count(1) cnt 
FROM whirlpool_mdsdb.cmdb_ci_final SRC 
JOIN whirlpool_mdwdb.d_configuration_item TRGT 
ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id  )
left JOIN whirlpool_mdwdb.d_lov SRC1 ON 
COALESCE(CONCAT('OPERATIONAL_STATUS~CMDB_CI~~~',UPPER(SRC.operational_status)),'UNSPECIFIED')=SRC1.row_id 
and SRC.sourceinstance=SRC1.source_id
WHERE  coalesce(SRC1.row_key,case when SRC.operational_status is null then 0 else -1 end ) <> 
TRGT.operational_status_src_c_key)b;

 
 