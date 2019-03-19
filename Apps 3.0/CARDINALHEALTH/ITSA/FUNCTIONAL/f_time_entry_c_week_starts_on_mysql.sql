SELECT 
CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN COUNT(1) >0 THEN 'MDS TO MDW DATA VALIDATION FAILED' ELSE 'Data Matched' END as Message
FROM
(
SELECT SRC.sys_id,TRGT.row_id,SRC.week_starts_on as col1 ,TRGT.week_starts_on as col2
FROM cardinalhealth_mdsdb.time_card_final SRC
LEFT JOIN cardinalhealth_mdwdb.f_time_entry_c TRGT ON SRC.sys_id =LEFT(TRGT.row_id,32 ) AND SRC.sourceinstance= TRGT.source_id  
WHERE SRC.week_starts_on <> TRGT.week_starts_on
)val
;