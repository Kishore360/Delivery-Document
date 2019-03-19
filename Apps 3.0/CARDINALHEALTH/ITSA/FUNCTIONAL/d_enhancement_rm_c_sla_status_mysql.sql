SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'Failure' ELSE 'Data Matched' END as Message
FROM (SELECT count(1) as CNT
FROM cardinalhealth_mdwdb.d_enhancement_rm_c d
JOIN cardinalhealth_mdsdb.rm_enhancement_final i ON d.row_id=i.sys_id AND d.source_id=i.sourceinstance
where d.sla_status<> 0)temp;
