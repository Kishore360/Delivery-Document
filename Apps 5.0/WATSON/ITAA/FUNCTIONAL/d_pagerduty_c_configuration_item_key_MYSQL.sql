SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_pagerduty_c.configuration_item_key ' ELSE 'SUCCESS' END as Message
from (SELECT Count(1) as cnt
FROM watson_mdsdb.x_pd_integration_additional_pagerduty_final SRC 
LEFT JOIN watson_mdwdb.d_pagerduty_c TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
JOIN watson_mdwdb.d_configuration_item LKP ON COALESCE(SRC.configuration_item,'UNSPECIFIED')=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.configuration_item IS NULL THEN 0 ELSE -1 END )<>TRGT.configuration_item_key
AND TRGT.soft_deleted_flag='N')ma;