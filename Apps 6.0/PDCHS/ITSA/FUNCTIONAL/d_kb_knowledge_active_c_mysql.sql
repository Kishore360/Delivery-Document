SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for kb_knowledge.active' ELSE 'SUCCESS' END as Message 
FROM (select sys_id,sourceinstance,active from pdchs_mdsdb.kb_knowledge_final where CDCTYPE<>'D') src
JOIN  pdchs_mdwdb.d_kb_knowledge_c trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id where 
(case src.active when 1 then 'Y' when 0 then 'N' end) <> trgt.active_c
;