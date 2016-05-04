
CREATE TABLE asu_mdwdb.xxxxx(r1 varchar(100),r2 varchar(100),reference_c_key bigint, index(r1),index(r2),index(reference_c_key));
INSERT INTO asu_mdwdb.xxxxx
SELECT substring(row_id,1,32) as r1, SUBSTRING(row_id,34,32) as r2, reference_c_key  FROM asu_mdwdb.f_request_item_variable_c;


select count(1) from 
-- f.row_key ,a.reference_c_key from 
-- (select b.value as asd,e.name,concat(b.sys_id,'~',d.request_item) as rowid,f.row_key,t.label,f.value,b.item_option_new,g.row_id,
-- 
(select type,sourceinstance,sys_id,name  from asu_mdsdb.item_option_new_final  where name='v_request_category'
and  

sys_id  in 
(select  row_id from  asu_workdb.lsm_ls_variable_list lvl where 
lvl.table_name='request_item' and lvl.variable_type!='Reference') 
 ) e
inner join asu_mdsdb.sc_item_option_final b 
on e.sys_id=b.item_option_new
and b.sourceinstance=e.sourceinstance  -- and b.sys_id='0385358131098640c50b53f329f9bd4c'

inner join asu_mdsdb.sc_item_option_mtom_final d
on d.sc_item_option=b.sys_id
and 

b.sourceinstance=d.sourceinstance

inner join asu_mdwdb.d_request_item c on d.request_item=c.row_id and c.source_id=d.sourceinstance

inner join asu_mdwdb.d_variable_c g on b.item_option_new=g.row_id and g.source_id=d.sourceinstance

inner join asu_mdwdb.d_variable_lov_c f on f.variable_id=g.row_id and f.value=b.value

join asu_mdsdb.sys_choice_final t  on t.name like 'question' and e.type=t.value and t.label='Select Box' and 

t.element='type' and t.label!='Reference'
inner join asu_mdwdb.xxxxx a 
on  a.r1= b.sys_id and a.r2=d.request_item
 where f.row_key <>a.reference_c_key ;