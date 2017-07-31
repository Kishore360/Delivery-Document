select 
case when CNT > 0 then 'WARNING' else 'SUCCESS' end as Result,
case when CNT > 0 then 'Distinct dimension classes which are not loaded into d_lov' else 'SUCCESS' end as Message
from (
select count(1) as CNT
from (select class_value as dimension_class
from bbandt_workdb.lsm_ls_system_variables conf
where conf.enable_flag = 'Y') SRC
left join bbandt_mdwdb.d_lov TGT
ON TGT.dimension_class = SRC.dimension_class
where TGT.row_id is null and SRC.dimension_class not like '%CALL%' 
and SRC.dimension_class not like '%FACILITIES%'
and SRC.dimension_class not like '%HR%'
)a;
