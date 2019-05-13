SELECT CASE WHEN CNT> 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for incident.u_category' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT count(1) as cnt 
FROM pdchs_mdsdb.kb_knowledge_final  a 
JOIN pdchs_mdwdb.d_kb_knowledge_c c ON a.sys_id=c.row_id AND a.sourceinstance=c.source_id
WHERE case when a.active=1 then 'Y' else 'N' end<>c.active_c and a.cdctype<>'D'

) temp;