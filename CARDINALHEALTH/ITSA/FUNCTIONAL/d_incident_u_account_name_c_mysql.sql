SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
cardinalhealth_mdsdb.incident_final id
left join cardinalhealth_mdsdb.u_m2m_accounts_users_final m2m 
on m2m.sys_id = id.u_account and m2m.sourceinstance = id.sourceinstance 
left join cardinalhealth_mdsdb.u_account_final ua 
on ua.sys_id=m2m.u_account and ua.sourceinstance=m2m.sourceinstance
join cardinalhealth_mdwdb.d_incident si
on id.sys_id=si.row_id and id.sourceinstance=si.source_id
where ua.u_name<>si.u_account_name_c;
