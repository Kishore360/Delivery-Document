SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.correlation_id' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) AS CNT 
FROM png_mdsdb.cmdb_ci_final as dci 
LEFT join png_mdwdb.d_configuration_item as pcb on dci.sys_id = pcb.row_id and dci.sourceinstance = pcb.source_id
where pcb.correlation_id_c <> COALESCE(dci.correlation_id,'UNSPECIFIED')
AND dci.cdctype<>'D'
) temp;