select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'sys_choice-d_lov row_di does not exist' else 'SUCCESS' end as Message
from (
select TGT.row_id a1 , SRC.row_id a2
from (select UPPER(concat(conf.class_value,'~~~',scf.value)) as row_id,scf.sourceinstance AS source_id
from gogo_workdb.lsm_ls_system_variables conf
join gogo_mdsdb.sys_choice_final scf on conf.table_value= scf.name and conf.column_value = scf.element
where conf.enable_flag = 'Y'
and scf.inactive = 0
and scf.language='en') SRC
left join gogo_mdwdb.d_lov TGT
ON TGT.row_id = SRC.row_id
and TGT.source_id = SRC.source_id
where TGT.row_id  <> SRC.row_id or TGT.row_id is null)a
union all
select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'sys_choice-d_lov row_di does not exist' else 'SUCCESS' end as Message
from (
select TGT.row_id a1 , SRC.row_id a2
from (select UPPER(concat(conf.class_value,'~~~',scf.value)) as row_id,scf.sourceinstance AS source_id
from netflix_workdb.lsm_ls_system_variables conf
join netflix_mdsdb.sys_choice_final scf on conf.table_value= scf.name and conf.column_value = scf.element
where conf.enable_flag = 'Y'
and scf.inactive = 0
and scf.language='en') SRC
left join netflix_mdwdb.d_lov TGT
ON TGT.row_id = SRC.row_id
and TGT.source_id = SRC.source_id
where TGT.row_id  <> SRC.row_id or TGT.row_id is null)a
union all
select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'sys_choice-d_lov row_di does not exist' else 'SUCCESS' end as Message
from (
select TGT.row_id a1 , SRC.row_id a2
from (select UPPER(concat(conf.class_value,'~~~',scf.value)) as row_id,scf.sourceinstance AS source_id
from pgi_workdb.lsm_ls_system_variables conf
join pgi_mdsdb.sys_choice_final scf on conf.table_value= scf.name and conf.column_value = scf.element
where conf.enable_flag = 'Y'
and scf.inactive = 0
and scf.language='en') SRC
left join pgi_mdwdb.d_lov TGT
ON TGT.row_id = SRC.row_id
and TGT.source_id = SRC.source_id
where TGT.row_id  <> SRC.row_id or TGT.row_id is null)a
union all
select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'sys_choice-d_lov row_di does not exist' else 'SUCCESS' end as Message
from (
select TGT.row_id a1 , SRC.row_id a2
from (select UPPER(concat(conf.class_value,'~~~',scf.value)) as row_id,scf.sourceinstance AS source_id
from redbull_workdb.lsm_ls_system_variables conf
join redbull_mdsdb.sys_choice_final scf on conf.table_value= scf.name and conf.column_value = scf.element
where conf.enable_flag = 'Y'
and scf.inactive = 0
and scf.language='en') SRC
left join redbull_mdwdb.d_lov TGT
ON TGT.row_id = SRC.row_id
and TGT.source_id = SRC.source_id
where TGT.row_id  <> SRC.row_id or TGT.row_id is null)a
union all
select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'sys_choice-d_lov row_di does not exist' else 'SUCCESS' end as Message
from (
select TGT.row_id a1 , SRC.row_id a2
from (select UPPER(concat(conf.class_value,'~~~',scf.value)) as row_id,scf.sourceinstance AS source_id
from rei_workdb.lsm_ls_system_variables conf
join rei_mdsdb.sys_choice_final scf on conf.table_value= scf.name and conf.column_value = scf.element
where conf.enable_flag = 'Y'
and scf.inactive = 0
and scf.language='en') SRC
left join rei_mdwdb.d_lov TGT
ON TGT.row_id = SRC.row_id
and TGT.source_id = SRC.source_id
where TGT.row_id  <> SRC.row_id or TGT.row_id is null)a
union all
select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'sys_choice-d_lov row_di does not exist' else 'SUCCESS' end as Message
from (
select TGT.row_id a1 , SRC.row_id a2
from (select UPPER(concat(conf.class_value,'~~~',scf.value)) as row_id,scf.sourceinstance AS source_id
from uclahealth_workdb.lsm_ls_system_variables conf
join uclahealth_mdsdb.sys_choice_final scf on conf.table_value= scf.name and conf.column_value = scf.element
where conf.enable_flag = 'Y'
and scf.inactive = 0
and scf.language='en') SRC
left join uclahealth_mdwdb.d_lov TGT
ON TGT.row_id = SRC.row_id
and TGT.source_id = SRC.source_id
where TGT.row_id  <> SRC.row_id or TGT.row_id is null)a
union all
select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'sys_choice-d_lov row_di does not exist' else 'SUCCESS' end as Message
from (
select TGT.row_id a1 , SRC.row_id a2
from (select UPPER(concat(conf.class_value,'~~~',scf.value)) as row_id,scf.sourceinstance AS source_id
from usf_workdb.lsm_ls_system_variables conf
join usf_mdsdb.sys_choice_final scf on conf.table_value= scf.name and conf.column_value = scf.element
where conf.enable_flag = 'Y'
and scf.inactive = 0
and scf.language='en') SRC
left join usf_mdwdb.d_lov TGT
ON TGT.row_id = SRC.row_id
and TGT.source_id = SRC.source_id
where TGT.row_id  <> SRC.row_id or TGT.row_id is null)a
union all
select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'sys_choice-d_lov row_di does not exist' else 'SUCCESS' end as Message
from (
select TGT.row_id a1 , SRC.row_id a2
from (select UPPER(concat(conf.class_value,'~~~',scf.value)) as row_id,scf.sourceinstance AS source_id
from weillcornell_workdb.lsm_ls_system_variables conf
join weillcornell_mdsdb.sys_choice_final scf on conf.table_value= scf.name and conf.column_value = scf.element
where conf.enable_flag = 'Y'
and scf.inactive = 0
and scf.language='en') SRC
left join weillcornell_mdwdb.d_lov TGT
ON TGT.row_id = SRC.row_id
and TGT.source_id = SRC.source_id
where TGT.row_id  <> SRC.row_id or TGT.row_id is null)a

