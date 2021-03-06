select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'Distinct dimension classes which are not loaded into d_lov' else 'SUCCESS' end as Message
from (
select TGT.dimension_class as d1 , SRC.dimension_class as d2
from (select class_value as dimension_class
from gogo_workdb.lsm_ls_system_variables conf
left join gogo_mdsdb.sys_choice_final scf on conf.table_value= scf.name and conf.column_value = scf.element
where conf.enable_flag = 'Y'
and scf.inactive = 0
and scf.language='en'
) SRC
left join gogo_mdwdb.d_lov TGT
ON TGT.dimension_class = SRC.dimension_class
where TGT.row_id is null and SRC.dimension_class not like '%CALL%' and SRC.dimension_class not like '%HR%'
and SRC.dimension_class not like '%SECURITY%' and  SRC.dimension_class not like '%CASE%'  
and SRC.dimension_class not like '%UNIT~SERVICE_ENTITLEMENT%'
)a;
