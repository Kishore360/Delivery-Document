





select case when count(1)> 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1)> 0 then 'MDS to DWH data validation failed between request_final and f_request: assigment_group_key' else 'SUCCESS' end as Message
from <<tenant>>_mdsdb.sc_request_final S
join app_test.lsm_ls_source_timezone L 
on(S.sourceinstance  = L.sourceid )

left join d_internal_organization DIO_AG
on (DIO_AG.row_id = S.assignment_group 
and DIO_AG.group_flag = 'Y')

where CRC32(concat(
ifnull(S.sys_id,''),
ifnull(S.sourceinstance,''),
coalesce(DIO_AG.row_key, case when S.assignment_group is not null then -1 else 0 end))
) not in (
select CRC32(concat(
ifnull(DWH.row_id,''),
ifnull(DWH.source_id,''),
ifnull(DWH.assignment_group_key,''))
) from <<tenant>>_mdwdb.f_request DWH);
