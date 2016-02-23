SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for Variables_u_support_group_school' ELSE 'SUCCESS' END as Message  from(
select 
-- from (select count(1)
a.r1, b.sys_id  ,a.r2,d.request_item,
 case when a.flag='Y' then 'Yes' else 'No' end aa ,Case when lvd.data_type ='FLAG' THEN left(b.value,255)   else null end as bb
 from 
(select type,sourceinstance,sys_id,name  from asu_mdsdb.item_option_new_final  where name='urgent'
and  

sys_id  in 
(select  row_id from  asu_workdb.lsm_ls_variable_list lvl where 
lvl.table_name='request_item' and lvl.variable_type!='Reference') 
 ) e
inner join asu_mdsdb.sc_item_option_final b 
on e.sys_id=b.item_option_new
and b.sourceinstance=e.sourceinstance  -- and b.sys_id='0385358131098640c50b53f329f9bd4c'

inner join asu_mdsdb.sc_item_option_mtom_final d
on d.sc_item_option=b.sys_id and b.sourceinstance=d.sourceinstance

inner join asu_mdwdb.d_request_item c
on d.request_item=c.row_id and c.source_id=d.sourceinstance
join asu_workdb.lsm_ls_variable_list z on e.sys_id=z.row_id and z.table_name='request_item' and z.variable_type!='Reference'
join asu_mdsdb.sys_choice_final t  on t.name='question' and e.type=t.value
join asu_workdb.lsm_ls_variable_datatype lvd on t.label = lvd.variable_type 
join (SELECT substring(row_id,1,32) as r1, SUBSTRING(row_id,34,32) as r2, flag  FROM asu_mdwdb.f_request_item_variable_c)a 
on  a.r1= b.sys_id and a.r2=d.request_item)v
where aa<>bb