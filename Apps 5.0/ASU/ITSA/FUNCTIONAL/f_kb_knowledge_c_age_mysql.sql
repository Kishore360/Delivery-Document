select 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_kb_knowledge_c.age' ELSE 'SUCCESS' END as Message
from
(select count(1) cnt FROM (select sys_id,sourceinstance,published from asu_mdsdb.kb_knowledge_final ) SRC 
join asu_mdwdb.f_kb_knowledge_c f ON (SRC.sys_id =f.row_id  AND SRC.sourceinstance= f.source_id and f.soft_deleted_flag='N' )
WHERE TIMESTAMPDIFF(second,CONVERT_TZ(CONVERT_TZ(SRC.published,'GMT' ,'US/Mountain'),'US/Mountain','GMT'),
(SELECT CONVERT_TZ(MAX(lastupdated),'US/Mountain','GMT') AS lastupdated FROM asu_mdwdb.d_o_data_freshness 
WHERE sourcename like 'ServiceNow%')) <> f.age
 )A ; 
 
 