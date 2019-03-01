SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_application.version' ELSE 'SUCCESS' END as Message 
FROM (
select count(1) as CNT from (select * from nbcu_mdsdb.cmdb_ci_appl_final ) SRC
LEFT JOIN nbcu_mdwdb.d_application TRGT
ON (SRC.sys_id= TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
where coalesce(SRC.version,'UNSPECIFIED')<>TRGT.version)temp;
