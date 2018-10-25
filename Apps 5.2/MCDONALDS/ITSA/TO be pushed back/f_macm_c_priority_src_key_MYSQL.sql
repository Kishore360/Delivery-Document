


SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation f_macm_c_priority_src_key failed ' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT count(1) as cnt 
from (select * FROM mcdonalds_mdsdb.x_scafe_mcdcr_chan_mcdcr_change_request_final where cdctype<>'D') SRC
JOIN mcdonalds_mdwdb.d_macm_c TRGT
ON (SRC.SYS_ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN mcdonalds_mdwdb.d_lov LKP
ON (CONCAT('PRIORITY~MACM','~~~',UPPER(SRC.priority))=LKP.row_id 
AND SRC.sourceinstance=LKP.source_id)
left join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
where (SRC.cdctime<=f1.lastupdated) and COALESCE(LKP.row_key,CASE WHEN SRC.priority IS NULL THEN 0 ELSE -1 END)<>(TRGT.priority_src_key)
)a;