select TGT.row_id a1 , SRC.row_id a2
from (select UPPER(concat(conf.class_value,'~~~',scf.value)) as row_id,scf.sourceinstance AS source_id
from whirlpool_workdb.lsm_ls_system_variables conf
join whirlpool_mdsdb.sys_choice_final scf on conf.table_value= scf.name and conf.column_value = scf.element
where conf.enable_flag = 'Y'
and scf.inactive = 0
and scf.language='en'
and conf.source_entity='sys_choice') SRC
left join whirlpool_mdwdb.d_lov TGT
ON TGT.row_id = SRC.row_id
and TGT.source_id = SRC.source_id
where coalesce(TGT.row_id,-99)  <> coalesce(SRC.row_id,-99)
and SRC.row_id not like '%GOAL~~~%'
and SRC.row_id not like '%PROJECT~~~%'
and SRC.row_id not like '%PORTFOLIO~~~%' 