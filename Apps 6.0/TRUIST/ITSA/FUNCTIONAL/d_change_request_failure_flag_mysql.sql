SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result, 
 CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_change_request.failure_flag' ELSE 'SUCCESS' END AS Message
FROM (
SELECT count(1) as CNT
FROM   truist_mdwdb.d_change_request a11
JOIN truist_mdwdb.f_change_request a12 ON a12.change_request_key = a11.row_key
JOIN truist_mdwdb.d_lov_map a13 ON a12.state_src_key = a13.src_key AND a13.dimension_wh_code IN('CLOSED','UNSPECIFIED') AND a13.DIMENSION_CLASS IN('STATE~CHANGE_REQUEST','UNSPECIFIED')
JOIN truist_mdwdb.d_lov_map a14 ON a11.change_request_status_c_key = a14.src_key  AND a14.DIMENSION_CLASS IN('STATUS_C~CHANGE_REQUEST','UNSPECIFIED')
where case when  ( a14.dimension_wh_code IN('UNSUCCESSFUL')) then 'Y' else 'N' end <> a11.failure_flag
and (a11.failure_flag IS NULL OR a11.failure_flag = 'N'))
temp;
