SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM ( select count(1) as cnt from weillcornell_mdsdb.incident_final a
inner join weillcornell_mdwdb.f_incident b on a.sys_id =b.row_id  and b.row_key <100
where a.u_consult_charge<>b.consult_charge_c ) c;

