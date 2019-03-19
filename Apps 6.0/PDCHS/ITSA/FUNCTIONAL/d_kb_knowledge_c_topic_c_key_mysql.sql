SELECT CASE WHEN CNT> 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for incident.u_category' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) AS CNT 
FROM (select * from pdchs_mdsdb.kb_knowledge_final where CDCTYPE<>'D') a 
JOIN pdchs_mdwdb.d_kb_knowledge_c c ON a.sys_id=c.row_id AND a.sourceinstance=c.source_id
join pdchs_mdwdb.d_lov b
on COALESCE(CONCAT('TOPIC_C','~','KNOWLEDGE','~',a.topic),'UNSPECIFIED')=b.row_id
WHERE coalesce(b.row_key,case when a.topic is null then 0 else -1 end )<>c.topic_c_key 
) temp;