SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message 
FROM asu_mdsdb.kb_knowledge_final SRC
JOIN asu_mdwdb.d_kb_knowledge_c TRGT
ON (TRGT.row_id=SRC.sys_id and TRGT.source_id=SRC.sourceinstance)
WHERE 
CONCAT('<a href=\"','https://asu.service-now.com/nav_to.do?uri=','kb_knowledge.do?sys_id=',SRC.sys_id,'\" target=\"_blank\">',SRC.number,'</a>')
<>TRGT.source_url
