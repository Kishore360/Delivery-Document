SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message
FROM (
select count(1) as cnt
from tjx_mdsdb.u_customer_service_final src
join tjx_mdwdb.f_customer_service_c trt
on src.sys_id=trt.row_id and src.sourceinstance=trt.source_id
where trim(src.u_zip_code)<>trt.zip_code  and trt.soft_deleted_flag='N') ma; 

