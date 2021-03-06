select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'sys_choice-d_lov row_di does not exist' else 'SUCCESS' end as Message
from (
select TGT.row_id a1 , SRC.row_id a2
from (select UPPER(concat(conf.class_value,'~~~',scf.value)) as row_id,scf.sourceinstance AS source_id
from nbcu_workdb.lsm_ls_system_variables conf
join nbcu_mdsdb.sys_choice_final scf on conf.table_value= scf.name and conf.column_value = scf.element
where conf.enable_flag = 'Y'
and scf.inactive = 0
and scf.language='en') SRC
left join nbcu_mdwdb.d_lov TGT
ON TGT.row_id = SRC.row_id
and TGT.source_id = SRC.source_id
where TGT.row_id  <> SRC.row_id or TGT.row_id is null
and SRC.row_id not like ('%PROJECT%')
and SRC.row_id not like ('%GOAL%')
and SRC.row_id not like ('%PORTFOLIO%') )a;



