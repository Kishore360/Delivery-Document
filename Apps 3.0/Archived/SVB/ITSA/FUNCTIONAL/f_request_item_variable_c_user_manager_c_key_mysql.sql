SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.has_breached_update_c_flag' ELSE 'SUCCESS' END as Message 
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
join svb_mdwdb.d_internal_contact d
	on d.row_id =  (Case when lvl.variable_type='Reference' AND q.reference='sys_user' and lvl.variable_name='user_manager' 
then COALESCE(concat('INTERNAL_CONTACT~',qa.value),'UNSPECIFIED') else 'UNSPECIFIED' end )  AND d.source_id =  qa.sourceinstance 
										AND DATE_FORMAT(d.pivot_date, '%Y-%m-%d %H:%i:%s') 
									BETWEEN effective_from AND effective_to
join svb_mdwdb.f_request_item_variable_c f on concat(qa.sys_id,'~',b.request_item)=f.row_id
where coalesce(d.row_key,case when qa.value is null then 0 else -1 end )<>user_manager_c_key
and lvl.table_name='request_item'



