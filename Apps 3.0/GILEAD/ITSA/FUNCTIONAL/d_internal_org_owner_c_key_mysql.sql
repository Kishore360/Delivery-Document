SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count(1) > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message from
gilead_mdwdb.d_internal_organization a 
left join  gilead_mdsdb.sys_user_group_final b
on (a.row_id=(CONCAT('GROUP~',b.sys_id)) AND a.source_id=b.sourceinstance)
left join gilead_mdwdb.d_internal_contact c
ON COALESCE(CONCAT('INTERNAL_CONTACT~',b.u_owner),'UNSPECIFIED')=c.row_id
where a.owner_c_key<>COALESCE(c.row_key);
