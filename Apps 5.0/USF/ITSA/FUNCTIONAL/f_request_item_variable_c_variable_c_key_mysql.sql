SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt 
from usf_mdsdb.sc_item_option_final qa  
inner join  usf_mdsdb.sc_item_option_mtom_final b 
on qa.sys_id=b.sc_item_option and qa.sourceinstance = b.sourceinstance 
left join usf_mdsdb.question_final q 
on qa.item_option_new=q.sys_id and qa.sourceinstance=q.sourceinstance 
and q.sys_id  in 
(select  row_id from  
usf_workdb.lsm_ls_variable_list lvl where lvl.table_name='request_item' ) 
join usf_mdsdb.sys_choice_final c 
on q.type=c.value and c.element='type' and c.name like 'question' and  c.sourceinstance=q.sourceinstance
left join usf_mdsdb.question_choice_final qc 
on qa.value=qc.value and qa.item_option_new=qc.question and qa.sourceinstance=qc.sourceinstance 
left join usf_workdb.lsm_ls_variable_datatype lvd on c.label = lvd.variable_type 
join
usf_mdwdb.f_request_item_variable_c trgt
on qa.sys_id=trgt.row_id and qa.sourceinstance=trgt.source_id
join
usf_mdwdb.d_variable_c lkp
on qa.item_option_new = lkp.row_id 
where coalesce(lkp.row_key,case when qa.item_option_new is null then 0 else -1 end) <> trgt.variable_c_key)c


