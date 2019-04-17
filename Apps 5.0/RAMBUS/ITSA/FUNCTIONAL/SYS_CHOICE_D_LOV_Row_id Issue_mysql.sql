select 
case when CNT > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when CNT > 0 then 'sys_choice-d_lov row_di does not exist' else 'SUCCESS' end as Message
from (
SELECT count(1) CNT
from (select UPPER(concat(conf.class_value,'~~~',scf.value)) as row_id1,scf.sourceinstance AS source_id1
from rambus_workdb.lsm_ls_system_variables conf
join (select scf1.name,scf1.element,scf1.inactive,scf1.language,scf1.value,scf1.sourceinstance from rambus_mdsdb.sys_choice_final scf1 ) scf
on conf.table_value= scf.name and conf.column_value = scf.element
where conf.enable_flag = 'Y'
and scf.inactive = 0
and scf.language='en') SRC
left join rambus_mdwdb.d_lov TGT
ON TGT.row_id = SRC.row_id1
and TGT.source_id = SRC.source_id1
where coalesce(TGT.row_id,-99)  <> coalesce(SRC.row_id1,-99)
and SRC.row_id1 not like '%GOAL~~~%'
and SRC.row_id1 not like '%PROJECT~~~%'
and SRC.row_id1 not like '%PORTFOLIO~~~%'
and SRC.row_id1 not like '%EXPENSE~~~~%'
and SRC.row_id1 not like '%ASSET~~~%'
and SRC.row_id1 not like '%EXPENSE_ITEM~~~%'
and SRC.row_id1 not like '%FACILITIES~~~%'

 )a;



