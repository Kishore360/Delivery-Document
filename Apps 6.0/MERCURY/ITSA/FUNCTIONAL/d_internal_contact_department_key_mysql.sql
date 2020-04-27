SELECT CASE WHEN CNT>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for d_internal_contact.department_key' ELSE 'SUCCESS' END as Message
FROM
(select count(1) as CNT FROM mercury_mdsdb.incident_final src
join mercury_mdwdb.f_incident a
on src.sys_id=a.row_id and src.sourceinstance=a.source_id
 JOIN mercury_mdwdb.d_incident i 
 ON a.incident_key = i.row_key
 join mercury_mdwdb.d_internal_contact ic
 on i.caller_key=ic.row_key
 join mercury_mdwdb.d_internal_organization io
 on ic.department_key=io.row_key
 where ic.department_key <> io.row_key
 ) der;