

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.exists_in_legacy_g234_c' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) AS CNT 
FROM png_mdsdb.pg_mega_pgb_application_rita_final SRC 
LEFT JOIN png_mdsdb.pg_mega_legacyg234_final SRC1 ON SRC.NAME=SRC1.Mega_ID AND SRC.sourceinstance=SRC1.sourceinstance AND SRC1.cdctype<>'D'
LEFT JOIN png_mdwdb.d_rita_application_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE (CASE WHEN SRC1.Mega_ID IS NOT NULL AND (SRC1.CIS_Rough_cut_assessment_done_YesNo='YES' OR SRC1.CIS_Rough_cut_assessment_done_YesNo='Y') 
THEN 'Y' ELSE 'N' END )<>TRGT.exists_in_legacy_g234_c
AND SRC.cdctype<>'D'
) temp;





