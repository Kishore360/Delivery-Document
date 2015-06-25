SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from(
SELECT A.SYS_ID,B.ROW_ID,A.  queue_manager_c_id A_queue_manager_c_id,B.  queue_manager_c_id B_queue_manager_c_id FROM
(SELECT SYS_ID,sourceinstance, u_queue_manager AS   queue_manager_c_id
FROM uclahealth_mdsdb.sys_user_group_final )A
LEFT OUTER JOIN  
(SELECT  queue_manager_c_id,source_id,ROW_ID FROM  uclahealth_workdb.ds_internal_organization
 )B on A.sourceinstance=B.source_id AND substring(b.row_id,instr(b.row_id,'~')+1,32)=SYS_ID
left join uclahealth_mdwdb.d_internal_contact F
on concat('INTERNAL_CONTACT~',b.u_queue_manager)=c.row_id
and b.sourceinstance=c.source_id
)H
WHERE A_queue_manager_c_id<> B_queue_manager_c_id)E;