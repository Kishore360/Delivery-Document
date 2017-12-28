select 
case when CNT > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when CNT > 0 then 'sys_choice-d_lov row_di does not exist' else 'SUCCESS' end as Message
from (
SELECT count(1) as CNT
from (select UPPER(concat(conf.class_value,'~~~',scf.value)) as row_id,scf.sourceinstance AS source_id
from <<tenant>>_workdb.lsm_ls_system_variables conf
join <<tenant>>_mdsdb.sys_choice_final scf on conf.table_value= scf.name and conf.column_value = scf.element
where conf.enable_flag = 'Y'
and scf.inactive = 0
and scf.language='en') SRC
left join <<tenant>>_mdwdb.d_lov TGT
ON TGT.row_id = SRC.row_id
and TGT.source_id = SRC.source_id
where coalesce(TGT.row_id,-99)  <> coalesce(SRC.row_id,-99)
and SRC.row_id not like '%GOAL~~~%'
and SRC.row_id not like '%PROJECT~~~%'
and SRC.row_id not like '%PORTFOLIO~~~%'
and SRC.row_id not like '%EXPENSE~~~~%'
 )a;



