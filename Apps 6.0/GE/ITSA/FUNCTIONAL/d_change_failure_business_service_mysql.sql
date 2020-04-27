select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.business_service' ELSE 'SUCCESS' END as Message
from (SELECT * FROM ge_mdsdb.change_request_final WHERE CDCTYPE<>'D') SRC
left join (SELECT * FROM ge_mdwdb.d_change_failure where year(effective_to)=2999 
) TRGT 
 ON SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance = TRGT.source_id
left join ge_mdwdb.d_service ser
on ser.row_id = CONCAT('BUSINESS_SERVICE~',SRC.business_service)
AND SRC.sourceinstance = ser.source_id   
 where coalesce(ser.name,'UNSPECIFIED') <>  TRGT.business_service 