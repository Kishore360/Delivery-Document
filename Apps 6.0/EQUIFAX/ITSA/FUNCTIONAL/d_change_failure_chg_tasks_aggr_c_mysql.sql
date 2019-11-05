SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_failure.chg_tasks_aggr_c' ELSE 'SUCCESS' END as Message 
FROM equifax_mdsdb.change_request_final SRC
JOIN equifax_mdwdb.d_change_failure TRGT  
ON (SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id ) and SRC.cdctype<>'D' and TRGT.current_flag='Y'
LEFT JOIN (select chg.sys_id , chg.sourceinstance,count(chgtsk.number) as chg_tsk_cnt from equifax_mdsdb.change_request_final chg
join equifax_mdsdb.change_task_final chgtsk
on chgtsk.change_request=chg.sys_id and chgtsk.sourceinstance=chg.sourceinstance
GROUP BY chg.sys_id, chg.sourceinstance) X
on TRGT.row_id=X.sys_id and TRGT.source_id=X.sourceinstance and TRGT.current_flag='Y'
WHERE CASE WHEN X.sys_id is null then 'UNSPECIFIED'
WHEN  chg_tsk_cnt<=2 then 'lte_2'
WHEN  chg_tsk_cnt>2 then 'gt_2' end <>TRGT.chg_tasks_aggr_c;
