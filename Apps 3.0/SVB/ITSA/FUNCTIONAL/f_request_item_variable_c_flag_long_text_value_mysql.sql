SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message FROM (
select count(1) as cnt from 
(select
CASE WHEN lvl.variable_type!='Reference' AND lvd.data_type ='DECIMAL' THEN qa.value else null end as numeric_value,f.numeric_value trgt3,
CASE WHEN lvl.variable_type!='Reference' AND lvd.data_type ='FLAG' AND qa.value='Yes' THEN 'Y' 
     WHEN lvl.variable_type!='Reference' AND lvd.data_type ='FLAG' AND qa.value='No' THEN 'N' 
	 ELSE null end as flag,f.flag as trgt1,
CASE WHEN lvl.variable_type!='Reference' AND lvd.data_type ='LONGTEXT' THEN qa.value else null end as longtext_value,f.longtext_value as trgt2
from svb_mdsdb.sc_item_option_final qa  
inner join  svb_mdsdb.sc_item_option_mtom_final b 
on qa.sys_id=b.sc_item_option and qa.sourceinstance = b.sourceinstance 
left join svb_mdsdb.question_final q 
on qa.item_option_new=q.sys_id and qa.sourceinstance=q.sourceinstance 
join svb_mdsdb.sys_choice_final c 
on q.type=c.value and c.element='type' 
and c.name like 'question' 
left join svb_mdsdb.question_choice_final qc 
on qa.value=qc.value and qa.item_option_new=qc.question 
and qa.sourceinstance=qc.sourceinstance 
left join svb_workdb.lsm_ls_variable_list lvl
on q.sys_id=lvl.row_id and  q.sourceinstance=lvl.source_id
join svb_workdb.lsm_ls_variable_datatype lvd 
on c.label = lvd.variable_type 
join svb_mdwdb.f_request_item_variable_c f on concat(qa.sys_id,'~',b.request_item)=f.row_id and qa.sourceinstance=f.source_id
where lvl.table_name='request_item')abc
where flag<>trgt1 or longtext_value<>trgt2 or numeric_value<>trgt3)abc