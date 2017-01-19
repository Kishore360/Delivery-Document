SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message, cnt
FROM (
select count(1) as cnt
from tjx_mdsdb.u_customer_service_final src
join tjx_mdwdb.f_customer_service_c trt
on trt.row_id=src.sys_id and trt.row_id=src.sourceinstance
where trt.address_2 <> trim(src.u_address_2) ) g; 


