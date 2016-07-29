SELECT CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN Count(1) > 0 THEN 
         'MDS to DWH data validation failed for f_change_request.failure_flag' 
         ELSE 'SUCCESS' 
       END AS Message 
   FROM   nbcu_mdsdb.change_request_final SRC 
        left JOIN nbcu_mdwdb.d_change_request TRGT 
              ON ( SRC.sys_id = TRGT.row_id 
                   AND SRC.sourceinstance = TRGT.source_id ) 
				left   join nbcu_mdwdb.f_change_request f_cr 
on SRC.sys_id=f_cr.row_id and SRC.sourceinstance=f_cr.source_id
       JOIN nbcu_mdwdb.d_lov br 
         ON (f_cr.completion_src_code_c = br.dimension_code
and f_cr.source_id =br.source_id 
            )
WHERE  br.dimension_class = 'COMPLETION_CODE_C~CHANGE_REQUEST' and 
case when f_cr.completion_src_code_c like '%Successful' then 'N'
     when f_cr.completion_src_code_c like '%Unsuccessful -%' then 'Y'
  else NULL end
        <> TRGT.failure_flag 

		