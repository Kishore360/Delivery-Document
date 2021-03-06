SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM ( select count(1) as cnt from gogo_mdsdb.change_request_final a
left outer join gogo_mdwdb.d_configuration_item c on a.u_it_business_service=c.row_id and a.sourceinstance=c.source_id 
inner join gogo_mdwdb.f_change_request  b on a.sys_id =b.row_id  and a.sourceinstance=b.source_id 
where  coalesce(c.row_key,case when u_it_business_service is null then 0 else -1 end ) <>b.it_business_service_c_key
) c;

