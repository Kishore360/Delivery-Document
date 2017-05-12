select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'Distinct dimension classes which are not loaded into d_lov' else 'SUCCESS' end as Message
from (
select TGT.dimension_class as d1 , SRC.dimension_class as d2
from (select class_value as dimension_class
from gogo_workdb.lsm_ls_system_variables conf
where conf.enable_flag = 'Y') SRC
left join gogo_mdwdb.d_lov TGT
ON TGT.dimension_class = SRC.dimension_class
where TGT.row_id is null)a
union all
select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'Distinct dimension classes which are not loaded into d_lov' else 'SUCCESS' end as Message
from (
select TGT.dimension_class as d1 , SRC.dimension_class as d2
from (select class_value as dimension_class
from netflix_workdb.lsm_ls_system_variables conf
where conf.enable_flag = 'Y') SRC
left join netflix_mdwdb.d_lov TGT
ON TGT.dimension_class = SRC.dimension_class
where TGT.row_id is null)a
union all
select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'Distinct dimension classes which are not loaded into d_lov' else 'SUCCESS' end as Message
from (
select TGT.dimension_class as d1 , SRC.dimension_class as d2
from (select class_value as dimension_class
from pgi_workdb.lsm_ls_system_variables conf
where conf.enable_flag = 'Y') SRC
left join pgi_mdwdb.d_lov TGT
ON TGT.dimension_class = SRC.dimension_class
where TGT.row_id is null)a
union all
select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'Distinct dimension classes which are not loaded into d_lov' else 'SUCCESS' end as Message
from (
select TGT.dimension_class as d1 , SRC.dimension_class as d2
from (select class_value as dimension_class
from redbull_workdb.lsm_ls_system_variables conf
where conf.enable_flag = 'Y') SRC
left join redbull_mdwdb.d_lov TGT
ON TGT.dimension_class = SRC.dimension_class
where TGT.row_id is null)a
union all
select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'Distinct dimension classes which are not loaded into d_lov' else 'SUCCESS' end as Message
from (
select TGT.dimension_class as d1 , SRC.dimension_class as d2
from (select class_value as dimension_class
from rei_workdb.lsm_ls_system_variables conf
where conf.enable_flag = 'Y') SRC
left join rei_mdwdb.d_lov TGT
ON TGT.dimension_class = SRC.dimension_class
where TGT.row_id is null)a
union all
select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'Distinct dimension classes which are not loaded into d_lov' else 'SUCCESS' end as Message
from (
select TGT.dimension_class as d1 , SRC.dimension_class as d2
from (select class_value as dimension_class
from uclahealth_workdb.lsm_ls_system_variables conf
where conf.enable_flag = 'Y') SRC
left join uclahealth_mdwdb.d_lov TGT
ON TGT.dimension_class = SRC.dimension_class
where TGT.row_id is null)a
union all
select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'Distinct dimension classes which are not loaded into d_lov' else 'SUCCESS' end as Message
from (
select TGT.dimension_class as d1 , SRC.dimension_class as d2
from (select class_value as dimension_class
from usf_workdb.lsm_ls_system_variables conf
where conf.enable_flag = 'Y') SRC
left join usf_mdwdb.d_lov TGT
ON TGT.dimension_class = SRC.dimension_class
where TGT.row_id is null)a
union all
select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'Distinct dimension classes which are not loaded into d_lov' else 'SUCCESS' end as Message
from (
select TGT.dimension_class as d1 , SRC.dimension_class as d2
from (select class_value as dimension_class
from weillcornell_workdb.lsm_ls_system_variables conf
where conf.enable_flag = 'Y') SRC
left join weillcornell_mdwdb.d_lov TGT
ON TGT.dimension_class = SRC.dimension_class
where TGT.row_id is null)a
