select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'sys_choice-d_lov row_di does not exist' else 'SUCCESS' end as Message
from (
select TGT.row_id a1 , SRC.row_id a2
from (select UPPER(concat(conf.class_value,'~',scf.value)) as row_id,scf.sourceinstance AS source_id
from asu_workdb.lsm_ls_system_variables conf
join asu_mdsdb.sys_choice_final scf on conf.table_value= scf.name and conf.column_value = scf.element
where conf.enable_flag = 'Y'
and scf.inactive = 0
and scf.language='en') SRC
left join asu_mdwdb.d_lov TGT
ON TGT.row_id = SRC.row_id
and TGT.source_id = SRC.source_id
where TGT.row_id  <> SRC.row_id or TGT.row_id is null)a

union all
select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'sys_choice-d_lov row_di does not exist' else 'SUCCESS' end as Message
from (
select TGT.row_id a1 , SRC.row_id a2
from (select UPPER(concat(conf.class_value,'~',scf.value)) as row_id,scf.sourceinstance AS source_id
from intuit_workdb.lsm_ls_system_variables conf
join intuit_mdsdb.sys_choice_final scf on conf.table_value= scf.name and conf.column_value = scf.element
where conf.enable_flag = 'Y'
and scf.inactive = 0
and scf.language='en') SRC
left join intuit_mdwdb.d_lov TGT
ON TGT.row_id = SRC.row_id
and TGT.source_id = SRC.source_id
where TGT.row_id  <> SRC.row_id or TGT.row_id is null)a
union all
select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'sys_choice-d_lov row_di does not exist' else 'SUCCESS' end as Message
from (
select TGT.row_id a1 , SRC.row_id a2
from (select UPPER(concat(conf.class_value,'~',scf.value)) as row_id,scf.sourceinstance AS source_id
from wow_workdb.lsm_ls_system_variables conf
join wow_mdsdb.sys_choice_final scf on conf.table_value= scf.name and conf.column_value = scf.element
where conf.enable_flag = 'Y'
and scf.inactive = 0
and scf.language='en') SRC
left join wow_mdwdb.d_lov TGT
ON TGT.row_id = SRC.row_id
and TGT.source_id = SRC.source_id
where TGT.row_id  <> SRC.row_id or TGT.row_id is null)a
union all
select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'sys_choice-d_lov row_di does not exist' else 'SUCCESS' end as Message
from (
select TGT.row_id a1 , SRC.row_id a2
from (select UPPER(concat(conf.class_value,'~',scf.value)) as row_id,scf.sourceinstance AS source_id
from mercuryinsurance_workdb.lsm_ls_system_variables conf
join mercuryinsurance_mdsdb.sys_choice_final scf on conf.table_value= scf.name and conf.column_value = scf.element
where conf.enable_flag = 'Y'
and scf.inactive = 0
and scf.language='en') SRC
left join mercuryinsurance_mdwdb.d_lov TGT
ON TGT.row_id = SRC.row_id
and TGT.source_id = SRC.source_id
where TGT.row_id  <> SRC.row_id or TGT.row_id is null)a
union all
select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'sys_choice-d_lov row_di does not exist' else 'SUCCESS' end as Message
from (
select TGT.row_id a1 , SRC.row_id a2
from (select UPPER(concat(conf.class_value,'~',scf.value)) as row_id,scf.sourceinstance AS source_id
from tesm_workdb.lsm_ls_system_variables conf
join tesm_mdsdb.sys_choice_final scf on conf.table_value= scf.name and conf.column_value = scf.element
where conf.enable_flag = 'Y'
and scf.inactive = 0
and scf.language='en') SRC
left join tesm_mdwdb.d_lov TGT
ON TGT.row_id = SRC.row_id
and TGT.source_id = SRC.source_id
where TGT.row_id  <> SRC.row_id or TGT.row_id is null)a
union all
select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'sys_choice-d_lov row_di does not exist' else 'SUCCESS' end as Message
from (
select TGT.row_id a1 , SRC.row_id a2
from (select UPPER(concat(conf.class_value,'~',scf.value)) as row_id,scf.sourceinstance AS source_id
from pan_workdb.lsm_ls_system_variables conf
join pan_mdsdb.sys_choice_final scf on conf.table_value= scf.name and conf.column_value = scf.element
where conf.enable_flag = 'Y'
and scf.inactive = 0
and scf.language='en') SRC
left join pan_mdwdb.d_lov TGT
ON TGT.row_id = SRC.row_id
and TGT.source_id = SRC.source_id
where TGT.row_id  <> SRC.row_id or TGT.row_id is null)a
