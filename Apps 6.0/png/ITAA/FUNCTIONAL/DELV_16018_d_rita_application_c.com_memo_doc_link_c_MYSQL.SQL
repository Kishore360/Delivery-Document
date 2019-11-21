SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_ext_c.com_memo_doc_link_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_mega_cmdb_ci_appl_final SRC 
LEFT JOIN  png_mdwdb.d_rita_application_ext_c TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
where coalesce(SRC.u_commissioning_memo_document_link, 'UNSPECIFIED')<>TRGT.com_memo_doc_link_c
AND SRC.cdctype='X'
) temp;




  

