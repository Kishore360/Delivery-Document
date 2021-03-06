select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'Distinct dimension classes which are not loaded into d_lov' else 'SUCCESS' end as Message
from (
select TGT.dimension_class as d1 , SRC.dimension_class as d2
from (select class_value as dimension_class
from homedepot_workdb.lsm_ls_system_variables conf
where conf.enable_flag = 'Y') SRC
left join homedepot_mdwdb.d_lov TGT
ON TGT.dimension_class = SRC.dimension_class
where TGT.row_id is null)a
union all
select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'Distinct dimension classes which are not loaded into d_lov' else 'SUCCESS' end as Message
from (
select TGT.dimension_class as d1 , SRC.dimension_class as d2
from (select class_value as dimension_class
from rambus_workdb.lsm_ls_system_variables conf
where conf.enable_flag = 'Y') SRC
left join rambus_mdwdb.d_lov TGT
ON TGT.dimension_class = SRC.dimension_class
where TGT.row_id is null)a
union all
select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'Distinct dimension classes which are not loaded into d_lov' else 'SUCCESS' end as Message
from (
select TGT.dimension_class as d1 , SRC.dimension_class as d2
from (select class_value as dimension_class
from starwood_workdb.lsm_ls_system_variables conf
where conf.enable_flag = 'Y') SRC
left join starwood_mdwdb.d_lov TGT
ON TGT.dimension_class = SRC.dimension_class
where TGT.row_id is null)a
union all
select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'Distinct dimension classes which are not loaded into d_lov' else 'SUCCESS' end as Message
from (
select TGT.dimension_class as d1 , SRC.dimension_class as d2
from (select class_value as dimension_class
from rambus_workdb.lsm_ls_system_variables conf
where conf.enable_flag = 'Y') SRC
left join rambus_mdwdb.d_lov TGT
ON TGT.dimension_class = SRC.dimension_class
where TGT.row_id is null)a
union all
select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'Distinct dimension classes which are not loaded into d_lov' else 'SUCCESS' end as Message
from (
select TGT.dimension_class as d1 , SRC.dimension_class as d2
from (select class_value as dimension_class
from coach_workdb.lsm_ls_system_variables conf
where conf.enable_flag = 'Y') SRC
left join coach_mdwdb.d_lov TGT
ON TGT.dimension_class = SRC.dimension_class
where TGT.row_id is null)a
union all
select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'Distinct dimension classes which are not loaded into d_lov' else 'SUCCESS' end as Message
from (
select TGT.dimension_class as d1 , SRC.dimension_class as d2
from (select class_value as dimension_class
from cardinalhealth_workdb.lsm_ls_system_variables conf
where conf.enable_flag = 'Y') SRC
left join cardinalhealth_mdwdb.d_lov TGT
ON TGT.dimension_class = SRC.dimension_class
where TGT.row_id is null)a
