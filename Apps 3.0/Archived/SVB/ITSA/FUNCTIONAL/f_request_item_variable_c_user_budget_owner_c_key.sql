 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from svb_mdsdb.sc_item_option_final qa  
inner join  svb_mdsdb.sc_item_option_mtom_final b 
on qa.sys_id=b.sc_item_option and qa.sourceinstance = b.sourceinstance 
inner join  svb_mdsdb.question_final q 
on qa.item_option_new=q.sys_id and qa.sourceinstance=q.sourceinstance 
join svb_mdsdb.sys_choice_final c 
on q.type=c.value and c.element='type' 
and c.name like 'question' 
left join svb_mdsdb.question_choice_final qc 
on qa.value=qc.value and qa.item_option_new=qc.question 
and qa.sourceinstance=qc.sourceinstance 
left join svb_workdb.lsm_ls_variable_list lvl
on q.sys_id=lvl.row_id and  q.sourceinstance=lvl.source_id and lvl.table_name='request_item'
join svb_workdb.lsm_ls_variable_datatype lvd 
on c.label = lvd.variable_type 
 left  JOIN  svb_mdwdb.f_request_item_variable_c f
on  f.ROW_ID = concat(qa.sys_id,'~',b.request_item) and qa.sourceinstance=f.source_id
join svb_mdwdb.d_internal_contact d
on Case when lvl.variable_type='Reference' AND q.reference='sys_user' and lvl.variable_name='user_budget_owner' then COALESCE(concat('INTERNAL_CONTACT~',qa.value),'UNSPECIFIED') else 'UNSPECIFIED' end = d.row_id
where COALESCE(d.row_key,CASE WHEN qa.value IS NULL THEN 0 else -1 end)<>f.user_budget_owner_c_key


 )c
