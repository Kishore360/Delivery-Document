SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for d_asset.is_loaner_flag_c' ELSE 'SUCCESS' END as Message 
 FROM (select count(1) as cnt from 
  wpl_mdsdb.alm_asset_final a
 left join wpl_mdwdb.d_asset b
 on a.sys_id=right(b.row_id,32) and a.sourceinstance=b.source_id
 where case when a.u_is_loaner =1 then 'Y' else 'N' end<>b.is_loaner_flag_c  and a.CDCTYPE='X')ma;
 
 
 