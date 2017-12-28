SELECT CASE
			   WHEN count(1) > 0 THEN 'FAILURE'
			   ELSE 'SUCCESS'
		   END AS RESULT,
		   CASE
			   WHEN count(1) >0 THEN 'Failure'
			   ELSE 'Data Matched'
		   END AS Message
	FROM (
select 
-- from (select count(1)
a.longtext_value aa ,
 Case when lvd.data_type ='LONGTEXT' THEN left(b.value,255)   else null end as bb 
 from 
(select type,sourceinstance,sys_id,name  from svb_mdsdb.item_option_new_final  where name='vm_server_project_number'
and  

sys_id  in 
(select  row_id from  svb_workdb.lsm_ls_variable_list lvl where 
lvl.table_name='request_item' and lvl.variable_type!='Reference') 
 ) e
inner join svb_mdsdb.sc_item_option_final b 
on e.sys_id=b.item_option_new
and b.sourceinstance=e.sourceinstance  -- and b.sys_id='0385358131098640c50b53f329f9bd4c'

inner join svb_mdsdb.sc_item_option_mtom_final d
on d.sc_item_option=b.sys_id and b.sourceinstance=d.sourceinstance

inner join svb_mdwdb.d_request_item c
on d.request_item=c.row_id and c.source_id=d.sourceinstance
join svb_workdb.lsm_ls_variable_list z on e.sys_id=z.row_id and z.table_name='request_item' and z.variable_type!='Reference'
join svb_mdsdb.sys_choice_final t  on t.name='question' and e.type=t.value
join svb_workdb.lsm_ls_variable_datatype lvd on t.label = lvd.variable_type 
inner join  svb_mdwdb.f_request_item_variable_c a 
on SUBSTRING(a.row_id,1,32)= b.sys_id
AND SUBSTRING(a.row_id,34,32)=  d.request_item)a
where aa<>bb
