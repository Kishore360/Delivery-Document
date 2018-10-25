SELECT 
CASE WHEN CNT  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT  THEN 'MDS to DWH data validation failed for f_request_task.scafe_core_realm_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT COUNT(1) as CNT 
FROM(select * from  mcdonalds_mdsdb.sc_task_final where cdctype<>'D') a 
JOIN mcdonalds_mdwdb.f_request_task b ON (a.sys_id=b.row_id AND a.sourceinstance=b.source_id)
JOIN mcdonalds_mdwdb.d_scafe_core_realm_c LKP ON (a.x_scafe_core_realm=LKP.row_id AND a.sourceinstance=LKP.source_id)
left join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = a.sourceinstance)
where (a.cdctime<=f1.lastupdated) and LKP.row_key <> b.scafe_core_realm_c_key
)temp;


