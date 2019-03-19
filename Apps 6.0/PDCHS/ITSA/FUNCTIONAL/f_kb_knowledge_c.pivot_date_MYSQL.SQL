SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_kb_knowledge_c.pivot_date' ELSE 'SUCCESS' END as Message
from
(select count(1) as CNT from  pdchs_mdsdb.kb_knowledge_final  SRC
left join pdchs_mdwdb.f_kb_knowledge_c TRGT on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
and SRC.sourceinstance=TRGT.source_id 
where convert_tz(SRC.sys_created_on,'GMT','America/New_York')<>TRGT.pivot_date 
AND SRC.CDCTYPE<>'D'
)temp;





