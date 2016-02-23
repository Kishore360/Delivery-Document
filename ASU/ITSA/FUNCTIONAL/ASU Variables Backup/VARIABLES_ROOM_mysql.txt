

CREATE TABLE asu_mdwdb.xxxxxyz(r1 varchar(100),r2 varchar(100),longtext_value varchar(250), index(r1),index(r2),index(longtext_value));
INSERT INTO asu_mdwdb.xxxxxyz
SELECT substring(row_id,1,32) as r1, SUBSTRING(row_id,34,32) as r2, longtext_value  FROM asu_mdwdb.f_request_item_variable_c;

select count(1) from (
select 
-- from (select count(1)
a.longtext_value aa ,
 Case when lvd.data_type ='LONGTEXT' THEN left(b.value,255)   else null end as bb 
 from 
(select type,sourceinstance,sys_id,name  from asu_mdsdb.item_option_new_final  where name='room'
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
join asu_mdwdb.xxxxxyz a 
on  a.r1= b.sys_id and a.r2=d.request_item)v
where aa<>bb