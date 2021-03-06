SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 
FROM 
 
(select count(1) as cnt 
from (select sys_id,sourceinstance from bbandt_mdsdb.incident_final where cdctype<>'D') SRC 
 
LEFT JOIN bbandt_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance= TRGT.source_id  )
 
WHERE SRC.sourceinstance <> TRGT.source_id) temp;
