

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.irisk_completion_date' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM pandg_mdsdb.pg_mega_pgb_application_rita_final SRC 
LEFT JOIN  pandg_mdwdb.d_rita_application_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(date_format(substring(replace(SRC.PG_iRISK_DATE,' ',''),1,14),'%Y-%m-%d %h:%i:%s'),'')<>TRGT.irisk_completion_date

) temp;




  
