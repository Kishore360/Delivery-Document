SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from pan_mdsdb.incident_final a
join pan_mdwdb.f_incident c 
on a.sourceinstance=c.source_id and a.sys_id=c.row_id
join pan_mdwdb.d_lov b on 
(concat('U_SERVICE_TYPE~INCIDENT~~~',(u_service_type)))=b.src_rowid
where b.row_key<>c.service_type_c_key

)i;