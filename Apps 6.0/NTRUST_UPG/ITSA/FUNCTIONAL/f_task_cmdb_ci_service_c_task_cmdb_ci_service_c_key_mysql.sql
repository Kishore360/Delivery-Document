



SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.u_expedite_reason_details_c' ELSE 'SUCCESS' END as Message
FROM 
(Select count(1) CNT
FROM  ntrust_mdsdb.task_cmdb_ci_service_final SRC
LEFT JOIN ntrust_mdwdb.f_task_cmdb_ci_service_c TRGT2 ON (SRC.sys_id=TRGT2.row_id AND SRC.sourceinstance=TRGT2.source_id)
  JOIN ntrust_mdsdb.task_final LKP ON coalesce(SRC.task,'UNSPECIFIED')=LKP.sys_id  AND SRC.sourceinstance=LKP.sourceinstance
  JOIN ntrust_mdwdb.d_service LKP1 ON  coalesce(LKP.cmdb_ci,'UNSPECIFIED')=LKP1.row_id  AND LKP1.source_id=LKP.sourceinstance
where  case when SRC.task is not null then coalesce(LKP1.row_key,-1) else 0 end  <> TRGT2.task_cmdb_ci_service_c_key and SRC.cdctype='X') temp;