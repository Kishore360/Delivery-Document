SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
(
select count(1) as cnt
from gilead_mdsdb.u_task_fss_final src
left join  gilead_mdwdb.d_task_fss_c trgt 
ON src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id 
left join gilead_mdwdb.d_lov c
on CONCAT('CUSTOMER_GEO_C~TASK_FSS_C~~~',src.u_customer_geo)=c.row_id
where coalesce(c.row_key,case when src.u_customer_geo is null then 0 else -1 end)<>trgt.customer_geo_c_key
and trgt.soft_deleted_flag='N'
)ma;

