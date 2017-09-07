SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_request_item.over_due_flag' ELSE 'SUCCESS' END as Message
FROM (
SELECT count(1) as CNT
FROM svb_mdsdb.problem_final SRC 
 LEFT JOIN svb_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
left join svb_mdwdb.d_lov_map p
on TRGT.state_src_key=p.src_key 
AND p.dimension_class = 'STATE~PROBLEM'
LEFT JOIN svb_mdwdb.d_internal_contact LKP 
 ON (LKP.user_name = TRGT.changed_by AND LKP.source_id = TRGT.source_id)
WHERE  dimension_wh_code='CLOSED' and (case when coalesce(TRGT.closed_by_key,0)=0 then coalesce(LKP.row_key,-1) 
 else TRGT.closed_by_key end) <>(TRGT.closed_by_key))a