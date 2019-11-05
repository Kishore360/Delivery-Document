SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_application.install_on' ELSE 'SUCCESS' END as Message
from
whirlpool_mdwdb.f_n_asset_weekly a
join
whirlpool_mdsdb.alm_asset_final b
on right(a.row_id,32) =  b.sys_id and a.source_id=b.sourceinstance
where 
case when (b.serial_number is not null and b.u_region_ref is not null and b.assigned_to is not null
and b.substatus is not null and b.location is not null and b.support_group is not null and b.u_support_vendor is not null )then 'Y'else 'N' end<>a.is_complete_c_flag
