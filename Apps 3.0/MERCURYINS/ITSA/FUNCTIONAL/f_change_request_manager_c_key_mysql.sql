SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message  from 	

(select count(1) cnt  from mercuryins_mdsdb.sys_user_final b
left join mercuryins_mdwdb.d_internal_contact a
on a.row_id=concat('INTERNAL_CONTACT~',b.manager) and b.sourceinstance=a.source_id
left join  mercuryins_mdwdb.d_internal_contact c
on  c.row_id=concat('INTERNAL_CONTACT~',b.sys_id)  and b.sourceinstance=c.source_id
WHERE COALESCE(a.row_key,CASE WHEN b.manager IS NULL THEN 0 else -1 end)<>c.manager_c_key)x