 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from  
svb_mdwdb.f_change_request dfi
join svb_mdsdb.change_request_final incf
on dfi.row_id = incf.sys_id and dfi.source_id= incf.sourceinstance
join svb_mdwdb.d_configuration_item d
on incf.u_primary_service=d.row_id
where coalesce(d.row_key, case when incf.u_primary_service is null then 0 else -1 end ) <>dfi.configuration_item_application_c_key
 )c;