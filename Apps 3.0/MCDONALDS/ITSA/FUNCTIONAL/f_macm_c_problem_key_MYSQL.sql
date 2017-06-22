
SELECT
CASE WHEN CNT  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT THEN 'MDS to DWH data validation failed for f_macm_c_problem_key' ELSE 'SUCCESS' END as Message
FROM
(
SELECT count(1) as CNT
FROM mcdonalds_mdsdb.x_scafe_mcdcr_chan_mcdcr_change_request_final SRC
LEFT JOIN mcdonalds_mdwdb.f_macm_c TRGT 
ON (SRC.SYS_ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id) 
LEFT JOIN mcdonalds_mdwdb.d_problem LKP 
ON COALESCE(SRC.u_problem, 'UNSPECIFIED')=LKP.row_id
WHERE 
COALESCE(LKP.row_key,-1)<>TRGT.problem_key
)a;