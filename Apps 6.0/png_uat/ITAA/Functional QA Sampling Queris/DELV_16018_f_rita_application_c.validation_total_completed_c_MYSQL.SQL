SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_rita_application_c.validation_total_completed_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM 
(
SELECT 
X.NAME,X.sourceinstance,
CASE WHEN GROUP_CONCAT(DISTINCT GAP_COLUMN) IS NULL THEN '' ELSE GROUP_CONCAT(DISTINCT GAP_COLUMN ORDER BY GAP_COLUMN) 
END AS MISSING_DATA_COLUMN,
SUM(COMPLETE) AS MISSING_DATA_COLUMN_TOTAL_COMPLETED,
SUM(SCOPE_COL_COUNT) AS MISSING_DATA_COLUMN_SCOPE_COL_COUNT,
CASE WHEN SUM(COMPLETE)/SUM(SCOPE_COL_COUNT) =1 THEN 'Compliant' ELSE 'Not Compliant' END AS MISSING_DATA_COMPLIANCE
FROM 
(
-- Ramp Date 
SELECT SRC.NAME,SRC.sourceinstance,
CASE WHEN SRC.RAMP_Date IS NULL OR SRC.RAMP_Date='' THEN ' Ramp Date ' ELSE 'UNSPECIFIED' END AS GAP_COLUMN,
CASE WHEN SRC.RAMP_Date IS NULL OR SRC.RAMP_Date='' THEN 0 ELSE 1 END as COMPLETE,
1 AS SCOPE_COL_COUNT
FROM png_mdsdb.pg_mega_pgb_application_rita_final SRC 
WHERE SRC.cdctype<>'D'
UNION ALL 
-- RAMP Location
SELECT SRC.NAME,SRC.sourceinstance,
CASE WHEN SRC.RAMP_Location IS NULL OR SRC.RAMP_Location='' THEN ' RAMP Location ' ELSE 'UNSPECIFIED' END AS GAP_COLUMN,
CASE WHEN SRC.RAMP_Location IS NULL OR SRC.RAMP_Location='' THEN 0 ELSE 1 END as COMPLETE,
1 AS SCOPE_COL_COUNT
FROM png_mdsdb.pg_mega_pgb_application_rita_final SRC 
WHERE SRC.cdctype<>'D'
UNION ALL 
-- Com_Memo_Date
SELECT SRC.NAME,SRC.sourceinstance,
CASE WHEN SRC.Com_Memo_Date IS NULL OR SRC.Com_Memo_Date='' THEN ' Com_Memo_Date ' ELSE 'UNSPECIFIED' END AS GAP_COLUMN,
CASE WHEN SRC.Com_Memo_Date IS NULL OR SRC.Com_Memo_Date='' THEN 0 ELSE 1 END as COMPLETE,
1 AS SCOPE_COL_COUNT
FROM png_mdsdb.pg_mega_pgb_application_rita_final SRC 
WHERE SRC.cdctype<>'D'
UNION ALL 

-- Com_Memo_Doc_Link
SELECT SRC.NAME,SRC.sourceinstance,
CASE WHEN SRC.Com_Memo_Doc_Link IS NULL OR SRC.Com_Memo_Doc_Link='' THEN ' Com_Memo_Doc_Link ' ELSE 'UNSPECIFIED' END AS GAP_COLUMN,
CASE WHEN SRC.Com_Memo_Doc_Link IS NULL OR SRC.Com_Memo_Doc_Link='' THEN 0 ELSE 1 END as COMPLETE,
1 AS SCOPE_COL_COUNT
FROM png_mdsdb.pg_mega_pgb_application_rita_final SRC 
WHERE SRC.cdctype<>'D'
) X 
GROUP BY X.NAME,X.sourceinstance
) Y
LEFT JOIN png_mdwdb.f_rita_application_c TRGT ON Y.NAME=TRGT.row_id AND Y.sourceinstance=TRGT.source_id 
WHERE Y.MISSING_DATA_COLUMN_TOTAL_COMPLETED<>TRGT.validation_total_completed_c
) temp;


