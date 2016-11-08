SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt 
from rei_mdsdb.sc_item_option_final qa  
inner join  rei_mdsdb.sc_item_option_mtom_final b 
on qa.sys_id=b.sc_item_option and qa.sourceinstance = b.sourceinstance 
left join rei_mdsdb.question_final q 
on qa.item_option_new=q.sys_id and qa.sourceinstance=q.sourceinstance 
and q.sys_id  in 
(select  row_id from  
rei_workdb.lsm_ls_variable_list lvl where lvl.table_name='request_item' ) 
join rei_mdsdb.sys_choice_final c 
on q.type=c.value and c.element='type' and c.name like 'question' and   c.sourceinstance=q.sourceinstance
left join rei_mdsdb.question_choice_final qc 
on qa.value=qc.value and qa.item_option_new=qc.question and qa.sourceinstance=qc.sourceinstance 
left join rei_workdb.lsm_ls_variable_datatype lvd on c.label = lvd.variable_type 
join
rei_mdwdb.f_request_item_variable_c trgt
on qa.sys_id=trgt.row_id and qa.sourceinstance=trgt.source_id
where case when (c.label !='Reference' and lvd.variable_type!='Reference') then Case 
when lvd.data_type ='VARCHAR(255)' THEN left(qa.value,255)   else null end 
when (c.label ='Reference' and lvd.variable_type='Reference') then null end <> trgt.longtext_value)c


