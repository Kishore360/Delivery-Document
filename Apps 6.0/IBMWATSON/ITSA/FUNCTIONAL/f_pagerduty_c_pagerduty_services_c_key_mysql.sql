SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_pagerduty_c.pagerduty_services_c_key ' ELSE 'SUCCESS' END as Message
from (SELECT Count(1) as cnt
FROM ibmwatson_mdsdb.x_pd_integration_additional_pagerduty_final SRC 
LEFT JOIN ibmwatson_mdwdb.f_pagerduty_c TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
JOIN ibmwatson_mdwdb.d_pagerduty_services_c LKP ON COALESCE(SRC.pd_service,'UNSPECIFIED')=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.pd_service IS NULL THEN 0 ELSE -1 END )<>TRGT.pagerduty_services_c_key
AND TRGT.soft_deleted_flag='N')ma;