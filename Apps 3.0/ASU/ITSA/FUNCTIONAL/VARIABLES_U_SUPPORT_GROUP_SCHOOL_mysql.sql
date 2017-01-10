SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for Variables_u_support_group_school' ELSE 'SUCCESS' END as Message  from
 -- f.row_key ,a.reference_c_key,a.r1, b.sys_id , a.r2,d.request_item from 
-- b.sys_id,temp_substrin.part1 ,temp_substrin.part2,d.request_item,f.row_key,a.reference_c_key from 
-- f.row_key ,a.reference_c_key from 
-- (select b.value as asd,e.name,concat(b.sys_id,'~',d.request_item) as rowid,f.row_key,t.label,f.value,b.item_option_new,g.row_id,
-- f.variable_id from 
(select type,sourceinstance,sys_id,name  from asu_mdsdb.item_option_new_final  where name='u_support_group_school'
and  sys_id  in 
(select  row_id from  asu_workdb.lsm_ls_variable_list lvl where 
lvl.table_name='request_item' and lvl.variable_type!='Reference') 
 ) e
inner join asu_mdsdb.sc_item_option_final b 
on e.sys_id=b.item_option_new
and b.sourceinstance=e.sourceinstance  -- and b.sys_id='0385358131098640c50b53f329f9bd4c'

inner join asu_mdsdb.sc_item_option_mtom_final d
on d.sc_item_option=b.sys_id
and b.sourceinstance=d.sourceinstance

inner join asu_mdwdb.d_request_item c
on d.request_item=c.row_id and c.source_id=d.sourceinstance

inner join asu_mdwdb.d_variable_c g on b.item_option_new=g.row_id and g.source_id=d.sourceinstance
-- inner join  temp_substrin   temp_substrin on b.sys_id=part1 and part2=  d.request_item

inner join (select variable_id,value,max(row_key) row_key from asu_mdwdb.d_variable_lov_c group by 1,2 having count(1)>1) f on f.variable_id=g.row_id and f.value=b.value
join asu_mdsdb.sys_choice_final t  on t.name like 'question' and e.type=t.value and
 t.label='Select Box' and t.element='type' and t.label!='Reference'
inner join (SELECT substring(row_id,1,32) as r1, SUBSTRING(row_id,34,32) as r2, reference_c_key  FROM asu_mdwdb.f_request_item_variable_c) a 
on  a.r1= b.sys_id and a.r2=d.request_item
 where f.row_key <>a.reference_c_key ;