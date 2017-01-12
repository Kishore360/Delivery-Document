

SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM
(Select count(*) as cnt
FROM coach_mdwdb.f_request_task TRGT
JOIN coach_mdsdb.sc_task_final SRC
ON (TRGT.row_id = SRC.sys_id AND TRGT.source_id=SRC.sourceinstance)
JOIN  coach_mdwdb.d_lov LKP
on (LKP.row_id = COALESCE(CONCAT('AWAITING_INFO_DETAIL_C~SC_TASK~~~',SRC.u_awaiting_info_detail),'UNSPECIFIED'))
WHERE 
coalesce(LKP.row_key,case when SRC.u_awaiting_info_detail is null then 0 else -1 end)<> TRGT.awaiting_info_c_Key)temp