SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for f_ad_hoc_request_c.on_hold_type_key' ELSE 'SUCCESS' END as Message 
 FROM (select count(1) as cnt from 
 whirlpool_mdsdb.u_ad_hoc_request_final a
 left join whirlpool_mdwdb.f_ad_hoc_request_c b
 on a.sys_id=b.row_id and a.sourceinstance=b.source_id
 left join whirlpool_mdwdb.d_lov lkp
 on COALESCE(CONCAT('U_ON_HOLD_TYPE_C~U_AD_HOC_REQUEST~',a.u_on_hold_type),'UNSPECIFIED')=lkp.row_id and a.sourceinstance=b.source_id
 where COALESCE(lkp.row_key,case when a.u_on_hold_type is null then 0 else -1 end)<>b.on_hold_type_key
 and a.cdctype='X')ma
  ;


