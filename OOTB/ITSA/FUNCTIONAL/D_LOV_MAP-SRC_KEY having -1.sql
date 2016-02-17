 
 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'SRC_KEY=-1 in d_lov_map issue' ELSE 'SUCCESS' END as Message
 FROM(
select lov.src_rowid lov_src_rowid,map.src_rowid map_src_rowid,lov.dimension_code lov_dimension_code,map.dimension_code lov_map_dimension_code,
lov.row_id,SRC.column_value,SRC.table_value,lov.row_key lov_row_key,map.src_key lov_map_src_key,
lov.dimension_class as lov_dimension_class,
map.dimension_class as map_dimension_class
from  <<tenant>>_mdwdb.d_lov_map map
 join <<tenant>>_mdwdb.d_lov lov on lov.src_rowid=map.src_rowid 
left join
(select conf.table_value table_value,conf.column_value column_value,UPPER(concat(conf.class_value,'~~~',scf.value)) as 
row_id,scf.sourceinstance AS source_id
from <<tenant>>_workdb.lsm_ls_system_variables conf
left join <<tenant>>_mdsdb.sys_choice_final scf on conf.table_value= scf.name and conf.column_value = scf.element
where conf.enable_flag = 'Y'
and scf.inactive = 0
and scf.language='en') SRC
on lov.row_id = SRC.row_id
and lov.source_id = SRC.source_id
where src_key=-1 )x