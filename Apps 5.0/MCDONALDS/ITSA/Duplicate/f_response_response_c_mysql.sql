SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_change_request.standard_change_c_key' ELSE 'SUCCESS' END as Message 
FROM (SELECT change_request_key,response FROM mcdonalds_mdwdb.f_response a11
		JOIN mcdonalds_mdwdb.d_survey_question a12 ON a11.question_key = a12.row_key WHERE a11.change_request_key>0 AND a12.question like '%potential impact to the%'
		) src

LEFT JOIN mcdonalds_mdwdb.d_change_request trgt ON src.change_request_key = trgt.row_key
WHERE trgt.restaurant_impact_c <> src.response; 
