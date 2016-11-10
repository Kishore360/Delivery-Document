SELECT CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN Count(1) > 0 THEN 
         'MDS to DWH data validation failed for f_change_request.failure_flag' 
         ELSE 'SUCCESS' 
       END AS Message 
FROM    tivo_mdwdb.d_change_request d_cr 
JOIN tivo_mdwdb.f_change_request f_cr ON d_cr.row_key=f_cr.change_request_key 
LEFT JOIN tivo_mdwdb.d_lov_map change_state ON f_cr.state_src_key = change_state.src_key
                AND change_state.dimension_class = 'STATE~CHANGE_REQUEST'
LEFT JOIN tivo_mdwdb.d_lov_map closure_code ON f_cr.closure_code_src_c_key = closure_code.src_key
                AND closure_code.dimension_class = 'CLOSURE_CODE~CHANGE_REQUEST'
WHERE f_cr.soft_deleted_flag ='N' and d_cr.failure_flag <> CASE WHEN change_state.dimension_wh_code <> 'CANCELLED'  AND closure_code.dimension_wh_code = 'SUCCESSFUL'      THEN 'N'         ELSE 'Y' END  
