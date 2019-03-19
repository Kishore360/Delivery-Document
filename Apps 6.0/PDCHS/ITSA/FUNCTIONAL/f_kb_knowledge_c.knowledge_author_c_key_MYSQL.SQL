SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_kb_knowledge_c.knowledge_author_c_key' ELSE 'SUCCESS' END as Message
from
(select count(1) as CNT from  pdchs_mdsdb.kb_knowledge_final  SRC
left join pdchs_mdwdb.f_kb_knowledge_c TRGT on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
left join pdchs_mdwdb.d_internal_contact lkp on COALESCE(concat('INTERNAL_CONTACT~',SRC.author),'UNSPECIFIED')=lkp.row_id
and SRC.sourceinstance=lkp.source_id 
where coalesce(lkp.row_key,case when SRC.author is null then 0 else -1 end )<>TRGT.knowledge_author_c_key 
AND SRC.CDCTYPE<>'D'
)temp;





