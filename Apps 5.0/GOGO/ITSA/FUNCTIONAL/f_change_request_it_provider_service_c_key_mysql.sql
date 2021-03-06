SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM ( select count(1) as cnt from gogo_mdsdb.change_request_final a
inner join gogo_mdwdb.f_change_request  b on a.sys_id=b.row_id and a.sourceinstance=b.source_id 
left outer join gogo_mdwdb.d_configuration_item c on a.u_it_provider_service=c.row_id
 where case when  a.u_it_provider_service is null then 0 
 else case when c.row_key is null then -1 else c.row_key end end <> b.it_provider_service_c_key
) c;


