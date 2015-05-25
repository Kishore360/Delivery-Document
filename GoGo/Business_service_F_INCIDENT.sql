SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM ( select count(*) as cnt from gogo_mdsdb.incident_final a
inner join gogo_mdwdb.f_incident  b on a.sys_id collate utf8_unicode_ci=b.row_id  #and b.row_key <100
left outer join gogo_mdwdb.d_configuration_item c on a.u_it_business_service=c.row_id
 where case when  a.u_it_business_service is null then '0' 
 else case when c.row_key is null then '-1' else c.row_key end end <>b.it_business_service_c_key
 ) c;
