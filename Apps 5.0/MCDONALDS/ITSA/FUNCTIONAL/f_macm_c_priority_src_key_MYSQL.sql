


SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation f_macm_c_priority_src_key failed ' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT count(1) as cnt 
FROM mcdonalds_mdsdb.x_scafe_mcdcr_chan_mcdcr_change_request_final SRC
JOIN mcdonalds_mdwdb.d_macm_c TRGT
ON (SRC.SYS_ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN mcdonalds_mdwdb.d_lov LKP
ON (CONCAT('PRIORITY~MACM','~~~',UPPER(SRC.priority))=LKP.row_id 
AND SRC.sourceinstance=LKP.source_id)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.priority IS NULL THEN 0 ELSE -1 END)<>(TRGT.priority_src_key)
)a;