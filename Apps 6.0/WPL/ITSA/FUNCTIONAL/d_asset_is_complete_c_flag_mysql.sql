SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for d_asset.is_complete_c_flag' ELSE 'SUCCESS' END as Message 
 FROM (select count(1) as cnt from 
  wpl_mdsdb.alm_asset_final f
 left join wpl_mdwdb.d_asset a
 on f.sys_id=right(a.row_id,32) and f.sourceinstance=a.source_id
WHERE ( (CASE WHEN f.location is null or f.serial_number is null or f.u_region_ref is null or f.assigned_to is null 
or f.substatus is null or f.u_support_vendor is null or f.support_group is null then 'N' else 'Y' end)<>a.is_complete_c_flag)
and f.CDCTYPE<>'D' )ma;
