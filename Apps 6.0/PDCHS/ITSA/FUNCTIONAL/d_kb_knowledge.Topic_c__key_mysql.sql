select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result, 
case when count(1) >0 then  'MDS to DWH data validation failed for kb_knowledge_c.Topic' else 'SUCCESS' end Message 
from pdchs_mdsdb.kb_knowledge_final SRC join pdchs_mdwdb.d_lov LKP on 
coalesce(concat('TOPIC_C~KNOWLEDGE~',SRC.topic),'UNSPECIFIED')=LKP.row_id and SRC.sourceinstance=LKP.source_id
join pdchs_mdwdb.d_kb_knowledge_c TRGT on SRC.sys_id = TRGT.row_id and SRC.sourceinstance=TRGT.source_id
where coalesce(LKP.row_key,case when SRC.topic is null then 0 else -1 end) <> TRGT.topic_c_key and SRC.cdctype<>'D';