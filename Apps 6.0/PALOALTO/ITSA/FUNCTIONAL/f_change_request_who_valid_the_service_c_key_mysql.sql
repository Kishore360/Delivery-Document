SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
from pan6_mdwdb.f_change_request a
JOIN pan6_mdsdb.change_request_final b 
ON right(a.row_id,32)=b.sys_id AND a.source_id=b.sourceinstance 
LEFT JOIN pan6_mdwdb.d_internal_contact e 
ON e.row_id= COALESCE(concat('INTERNAL_CONTACT~',b.u_who_validated_the_service),'UNSPECIFIED')
AND e.source_id=b.sourceinstance
where a.who_valid_the_service_c_key<> case when b.u_who_validated_the_service is null then 0  ELSE (e.row_key) END;