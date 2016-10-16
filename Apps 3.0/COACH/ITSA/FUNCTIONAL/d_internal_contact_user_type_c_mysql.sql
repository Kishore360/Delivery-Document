SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt from coach_mdwdb.d_internal_contact fi
join coach_mdsdb.sys_user_final f ON (fi.row_id =CONCAT('INTERNAL_CONTACT~',f.sys_id))
where fi.user_type_c <> COALESCE(f.u_user_type,'UNSPECIFIED')) c;