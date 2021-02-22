SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'DWH to DWH data validation failed for d_request_item.csat_range_bucket_c_key' ELSE 'SUCCESS' END as Message 
FROM mcd_mdwdb.d_request_item d_request_item   
    INNER JOIN
        ( SELECT
            f_task_survey.request_item_key AS request_item_key,
            sum(f_response.response_value)/count(f_response.response_value) AS csat_range      
        FROM
            mcd_mdwdb.f_task_survey f_task_survey     
        INNER JOIN
            mcd_mdwdb.f_response f_response 
                ON f_task_survey.survey_instance_key=f_response.survey_instance_key 
        INNER JOIN
            mcd_mdwdb.d_request_item d_request_item 
                ON f_task_survey.request_item_key=d_request_item.row_key    
        WHERE
            (
                f_response.response_value>0 
                and f_response.response_value is not null 
                and f_task_survey.request_item_key>0
            ) 
            group by f_task_survey.request_item_key) t_d_request_item_csat_c_key_mcd 
            ON d_request_item.row_key=t_d_request_item_csat_c_key_mcd.request_item_key  
    INNER JOIN
        mcd_mdwdb.d_lov d_lov 
            ON d_lov.dimension_class='WH_CSAT_RANGE_BUCKET_C~SURVEY' 
            and t_d_request_item_csat_c_key_mcd.csat_range between d_lov.lower_range_value and d_lov.upper_range_value 
    WHERE
        d_lov.row_key<>d_request_item.csat_range_bucket_c_key and d_request_item.soft_deleted_flag='N';