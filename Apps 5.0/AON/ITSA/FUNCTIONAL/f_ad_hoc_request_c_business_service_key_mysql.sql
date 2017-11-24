 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_ad_hoc_request_c.business_service_key' 
 ELSE 'SUCCESS' END as Message from(
 SELECT count(1) as cnt 
 from aon_mdwdb.f_ad_hoc_request_c a
join aon_mdsdb.u_ad_hoc_request_final b
on a.row_id=b.sys_id
and a.source_id=b.sourceinstance
  JOIN  aon_mdwdb.d_service LKP  
 ON (COALESCE(CONCAT('BUSINESS_SERVICE~',b.u_business_service),'UNSPECIFIED'))= LKP.row_id 
AND b.sourceinstance= LKP.source_id 
 WHERE COALESCE(LKP.row_key,CASE WHEN u_business_service is null  THEN 0 else -1 end) <> (a.business_service_key))x
 
 