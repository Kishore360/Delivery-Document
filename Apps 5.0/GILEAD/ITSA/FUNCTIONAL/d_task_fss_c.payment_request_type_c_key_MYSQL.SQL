SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
(
select coalesce(LKP.row_key,case when SRC.u_payment_request_type is null then 0  else -1 end ),TRGT.payment_request_type_c_key
from gilead_mdsdb.u_task_fss_final SRC
join gilead_mdwdb.d_task_fss_c TRGT 
ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
left join gilead_mdwdb.d_lov LKP
on CONCAT('PAYMENT_REQUEST_C~TASK_FSS_C~~~',SRC.u_payment_request_type)=TRGT.row_id and SRC.sourceinstance=LKP.source_id
where coalesce(LKP.row_key,case when SRC.u_payment_request_type is null then 0  else -1 end )<>TRGT.payment_request_type_c_key
)ma