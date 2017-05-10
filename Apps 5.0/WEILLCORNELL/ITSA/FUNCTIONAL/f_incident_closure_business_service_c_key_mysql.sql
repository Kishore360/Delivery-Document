SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM ( select count(1) as cnt from weillcornell_mdsdb.incident_final a
inner join  weillcornell_mdwdb.f_incident b on a.sys_id =b.row_id  and a.sourceinstance = b.source_id
and b.closure_business_service_c_key =-1
left outer join weillcornell_mdwdb.d_configuration_item c on a.u_closure_business_service=c.row_id 
where case when  a.u_closure_business_service is null then '0' 
else case when c.row_key is null then '-1' else c.row_key end end <>b.closure_business_service_c_key
 ) c;
 
 