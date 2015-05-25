SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM ( select count(*)
from cardinalhealth_mdsdb.incident_final s
inner join cardinalhealth_workdb.dwh_d_incident i on s.sys_id collate utf8_unicode_ci=i.row_id
left outer join cardinalhealth_mdsdb.u_m2m_accounts_users_final m2m
on m2m.sys_id = s.u_account
left outer join cardinalhealth_mdsdb.u_account_final a
on a.sys_id = m2m.u_account
where coalesce(a.u_number collate utf8_unicode_ci,'0')<>coalesce(i.u_account_number_c ,'0')
) c;