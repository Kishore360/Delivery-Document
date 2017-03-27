select 
case when CNT > 0 then 'WARNING' else 'SUCCESS' end as Result,
case when CNT > 0 then 'Distinct dimension classes which are not loaded into d_lov' else 'SUCCESS' end as Message
from (
select count(1) as CNT
from (select class_value as dimension_class
from <<tenant>>_workdb.lsm_ls_system_variables conf
join <<tenant>>_mdsdb.sys_choice_final scf on conf.table_value= scf.name and conf.column_value = scf.element
where conf.enable_flag = 'Y'
and scf.inactive = 0
and scf.language='en') SRC
left join <<tenant>>_mdwdb.d_lov TGT
ON TGT.dimension_class = SRC.dimension_class
where TGT.row_id is null and SRC.dimension_class not like '%CALL%' and SRC.dimension_class not like '%FACILITIES%')a;
