SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_request.result_of_change_c_flag' ELSE 'SUCCESS' END as Message 
FROM mcdonalds_mdsdb.change_request_final  change_request 
JOIN  mcdonalds_mdwdb.d_change_failure_c TRGT 
ON (change_request.sys_id = TRGT.row_id  
AND change_request.sourceinstance = TRGT.source_id )
LEFT OUTER JOIN
    mcdonalds_mdsdb.sys_choice_final cat ON BINARY change_request.category = cat.value
        AND change_request.sourceinstance = cat.sourceinstance
        AND cat.element = 'category'
        AND cat.name = 'change_request'
        AND cat.language = 'EN'
        AND cat.inactive = 0
        AND ((change_request.category , cat.sys_created_on) IN (SELECT 
            sys_choice.value AS category,
                MAX(sys_choice.sys_created_on) AS max
        FROM
            mcdonalds_mdsdb.sys_choice_final sys_choice
        WHERE
            sys_choice.element = 'category'
                AND sys_choice.name = 'change_request'
                AND sys_choice.language = 'EN'
                AND sys_choice.inactive = 0
        GROUP BY sys_choice.value))  
WHERE change_request.category<> (TRGT.category_src_code)


