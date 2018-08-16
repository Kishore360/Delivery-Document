SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for kb_knowledge_c.category' ELSE 'SUCCESS' END as Message
From pdchs_mdsdb.kb_knowledge_final SRC
JOIN pdchs_mdwdb.d_lov LKP ON COALESCE(concat('KB_CATEGORY_C~KNOWLEDGE~',SRC.category ),'UNSPECIFIED')=LKP.row_id AND SRC.sourceinstance=LKP.source_id
JOIN pdchs_mdwdb.d_kb_knowledge_c TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.category IS NULL THEN 0 ELSE -1 END) <> TRGT.category_c_key and SRC.cdctype<>'D';