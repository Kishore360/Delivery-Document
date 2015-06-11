





select case when count(1)> 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1)> 0 then 'MDS to DWH data validation failed between problem_final and f_problem: assigment_group_key' else 'SUCCESS' end as Message
from #MDS_TABLE_SCHEMA.problem_final S
join app_test.lsm_ls_source_timezone L 
on(convert(S.sourceinstance using utf8)  = convert(L.sourceid using utf8))

left join d_internal_organization DIO_AG
on (convert(DIO_AG.row_id using utf8) = convert(S.assignment_group using utf8)
and DIO_AG.group_flag = 'Y')

where CRC32(convert(concat(
ifnull(S.sys_id,''),
ifnull(S.sourceinstance,''),
coalesce(DIO_AG.row_key, case when S.assignment_group is not null then -1 else 0 end))
using utf8)) not in (
select CRC32(convert(concat(
ifnull(DWH.row_id,''),
ifnull(DWH.source_id,''),
ifnull(DWH.assignment_group_key,''))
using utf8)) from #TABLE_SCHEMA.f_problem DWH);
