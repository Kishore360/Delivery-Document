SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for f_ad_hoc_request_c.closed_by_key' ELSE 'SUCCESS' END as Message 
 FROM (select count(1) as cnt from 
 wpl_mdsdb.u_ad_hoc_request_final a
 left join wpl_mdwdb.f_ad_hoc_request_c b
 on a.sys_id=b.row_id and a.sourceinstance=b.source_id
 left join wpl_mdwdb.d_internal_contact lkp  
 on COALESCE(CONCAT('INTERNAL_CONTACT~',a.closed_by),'UNSPECIFIED')=lkp.row_id and a.sourceinstance=lkp.source_id
 where coalesce(lkp.row_key,case when a.closed_by is null then 0 else -1 end)<>b.closed_by_key
 and a.cdctype='X')ma
  ;


