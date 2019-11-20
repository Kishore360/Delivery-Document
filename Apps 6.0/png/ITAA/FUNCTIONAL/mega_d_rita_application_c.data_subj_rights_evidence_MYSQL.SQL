

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.data_subj_rights_evidence' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_mega_cmdb_ci_appl_final SRC 
join png_mdsdb.pg_mega_pgb_application_rita_final a
on SRC.u_pg_source_system_id=a.name and SRC.sourceinstance=a.sourceinstance
LEFT JOIN  png_mdwdb.d_rita_application_c TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE (IF(a.DATA_SUBJ_RIGHTS_EVIDENCE IS NOT NULL AND a.DATA_SUBJ_RIGHTS_EVIDENCE <>'', a.DATA_SUBJ_RIGHTS_EVIDENCE,'UNSPECIFIED'))<>TRGT.data_subj_rights_evidence
AND SRC.cdctype='X' and a.cdctype='X'
) temp;



