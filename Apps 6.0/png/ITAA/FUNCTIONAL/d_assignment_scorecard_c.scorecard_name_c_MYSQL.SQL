SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_assignment_scorecard_c.scorecard_name_c' ELSE 'SUCCESS' END as Message
FROM
(
 Select Count(1) as CNT 
 FROM png_mdsdb.us_assignment_scorecard_mapping_final SRC
 LEFT JOIN png_mdwdb.d_assignment_scorecard_c TRGT ON SRC.Assignment_Group=TRGT.row_id  AND SRC.sourceinstance=TRGT.source_id
 WHERE COALESCE(SRC.Scorecard_Name,'UNSPECIFIED')<>TRGT.scorecard_name_c
 AND SRC.cdctype='X'
) temp;


