SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for d_asset.is_complete_c_flag' ELSE 'SUCCESS' END as Message 
 FROM (select count(1) as cnt from 
  whirlpool_mdsdb.alm_asset_final b
 left join whirlpool_mdwdb.d_asset a
 on b.sys_id=right(a.row_id,32) and b.sourceinstance=a.source_id
 where case when (b.serial_number is not null or b.location is not null or b.assigned_to is not null
or b.u_region_ref is not null or b.substatus is not null or b.u_support_vendor is not null or b.support_group is not null )then 'Y' else 'N' end<>a.is_complete_c_flag
and b.CDCTYPE<>'D')ma;