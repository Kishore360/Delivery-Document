
 SELECT TRGT.request_key ,b.request_key,b.assigned_to_key req_item_assign_to_key ,
 TRGT.assigned_to_key trgt_assgn_to_key
 FROM nbcu_mdsdb.sc_task_final SRC
 LEFT JOIN nbcu_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id ) =(TRGT.row_id ) join
 (
select  request_key,request_item_key,assignment_group_key,assigned_to_key,count(1) 
from nbcu_mdwdb.f_request_item 
group by request_key having count(1)<=1 ) b
on TRGT.request_key=b.request_key
where b.assigned_to_key <> TRGT.assigned_to_key ;