SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for kb_knowledge_c.kb_category' ELSE 'SUCCESS' END as Message
From pdchs_mdsdb.kb_knowledge_final SRC1
LEFT JOIN pdchs_mdsdb.kb_category_final SRC2 ON SRC1.kb_category=SRC2.sys_id AND SRC1.sourceinstance=SRC2.sourceinstance
JOIN pdchs_mdwdb.d_kb_category_c LKP ON SRC2.sys_id=LKP.row_id AND SRC2.sourceinstance=LKP.source_id
JOIN pdchs_mdwdb.f_kb_knowledge_c TRGT ON SRC1.sys_id=TRGT.row_id AND SRC1.sourceinstance=TRGT.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC1.kb_category IS NULL THEN 0 ELSE -1 END) <> TRGT.knowledge_category_c_key and (SRC1.cdctype<>'D' or SRC2.cdctype<>'D');