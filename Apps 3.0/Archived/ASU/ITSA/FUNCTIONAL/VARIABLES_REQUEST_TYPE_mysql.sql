SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt  >0 THEN 'MDS to DWH data validation failed for Variables_u_room' ELSE 'SUCCESS' END as Message 
from  
(select count(1)  as cnt from
(select type,sourceinstance,sys_id,name  from asu_mdsdb.item_option_new_final  where name='request_type'
and  sys_id  in 
(select  row_id from  asu_workdb.lsm_ls_variable_list lvl where 
lvl.table_name='request_item' and lvl.variable_type!='Reference') 
 ) e
inner join asu_mdsdb.sc_item_option_final b 
on e.sys_id=b.item_option_new
and b.sourceinstance=e.sourceinstance 
inner join asu_mdsdb.sc_item_option_mtom_final d
on d.sc_item_option=b.sys_id
and b.sourceinstance=d.sourceinstance)tmp