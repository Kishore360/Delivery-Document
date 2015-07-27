SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from(
SELECT a.sys_id,b.row_id,a.  u_director  a_director_c_id ,b.  director_c_id b_director_c_id,
(case when u_director is null then 'UNSPECIFIED' else coalesce(concat('INTERNAL_CONTACT~',u_director),-1) end)
FROM
(SELECT sys_id,sourceinstance, u_director  
FROM uclahealth_mdsdb.sys_user_group_final )a
LEFT OUTER JOIN  
(SELECT  director_c_id,source_id,row_id FROM  uclahealth_workdb.ds_internal_organization
 )b on a.sourceinstance=b.source_id AND  substring(b.row_id,instr(b.row_id,'~')+1,32)=sys_id
left join uclahealth_workdb.ds_internal_contact c
on concat('INTERNAL_CONTACT~',a.u_director)=c.row_id
and a.sourceinstance=c.source_id
)H
WHERE b_director_c_id<>(case when a_director_c_id is null then 'UNSPECIFIED' else coalesce(concat('INTERNAL_CONTACT~',a_director_c_id),-1) end))E;


