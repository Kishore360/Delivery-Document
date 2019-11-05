 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_request_item.changed_by' ELSE 'SUCCESS' END as Message from(
 SELECT count(1) as cnt 
 from whirlpool_mdwdb.f_ad_hoc_request_c a
join whirlpool_mdsdb.u_ad_hoc_request_final b
on a.row_id=b.sys_id
and a.source_id=b.sourceinstance
  JOIN  whirlpool_mdwdb.d_service LKP  
 ON (COALESCE(CONCAT('BUSINESS_SERVICE~',b.u_business_service),'UNSPECIFIED'))= LKP.row_id 
AND b.sourceinstance= LKP.source_id 
 WHERE COALESCE(LKP.row_key,CASE WHEN u_business_service is null  THEN 0 else -1 end) <> (a.business_service_key)
 and b.cdctype='X')x
 
 