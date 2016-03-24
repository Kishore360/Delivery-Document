SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count(1) > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message  
from
gilead_mdsdb.sys_user_group_final b
left join  gilead_mdwdb.d_internal_organization a
on (a.row_id=(CONCAT('GROUP~',b.sys_id)) AND a.source_id=b.sourceinstance)
left join gilead_mdwdb.d_internal_organization c
ON COALESCE(CONCAT('GROUP~',b.u_escalation_group),'UNSPECIFIED')=c.row_id
where a.escalation_group_c_key<>(c.row_key);
