SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_ext_c.com_memo_doc_link_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_mega_pgb_application_rita_final SRC 
LEFT JOIN  png_mdwdb.d_rita_application_ext_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC.Com_Memo_Doc_Link,'UNSPECIFIED')<>TRGT.com_memo_doc_link_c
AND SRC.cdctype<>'D'
) temp;




  

