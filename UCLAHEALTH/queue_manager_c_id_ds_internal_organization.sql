SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from(
SELECT a.sys_id,b.row_id   ,b.  queue_manager_c_id b_queue_manager_c_id  ,a.u_queue_manager a_u_queue_manager,
(case when a.u_queue_manager is null then 'UNSPECIFIED' else coalesce(concat('INTERNAL_CONTACT~',a.u_queue_manager),-1) end)
FROM
(SELECT sys_id,sourceinstance, u_queue_manager  
FROM uclahealth_mdsdb.sys_user_group_final )a
 left JOIN  
(SELECT  queue_manager_c_id,source_id,row_id FROM  uclahealth_workdb.ds_internal_organization
 )b on a.sourceinstance=b.source_id AND  substring(b.row_id,instr(b.row_id,'~')+1,32)=sys_id
 left join uclahealth_workdb.ds_internal_contact c
on concat('INTERNAL_CONTACT~',a.u_queue_manager)=c.row_id
and a.sourceinstance=c.source_id
)h
where b_queue_manager_c_id<>(case when a_u_queue_manager is null then 'UNSPECIFIED' else coalesce(concat('INTERNAL_CONTACT~',a_u_queue_manager),-1) end))E;


