 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM ( select count(*) as cnt from weillcornell_mdsdb.incident_final a
inner join weillcornell_mdwdb.f_incident  b on a.sys_id collate utf8_unicode_ci=b.row_id  and b.row_key <100
left outer join weillcornell_mdwdb.d_configuration_item c on a.u_bsd_business_service=c.row_id where a.u_bsd_business_service is not null
 where case when  a.u_bsd_business_service is null then '0' 
 else case when c.row_key is null then '-1' else c.row_key end end <>b.bsd_business_service_c_key
  ) c;
 
 


