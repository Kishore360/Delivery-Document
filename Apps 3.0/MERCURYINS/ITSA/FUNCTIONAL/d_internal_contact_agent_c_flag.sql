SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select COUNT(1) cnt from
mercuryinsurance_mdsdb.sys_user_final a join
 mercuryinsurance_mdwdb.d_internal_contact b
on concat('INTERNAL_CONTACT~',a.sys_id)=b.row_id
and a.sourceinstance=b.source_id
where 
case when a.u_agent=1 THEN 'Y' ELSE 'N' END <>b.agent_c_flag)b