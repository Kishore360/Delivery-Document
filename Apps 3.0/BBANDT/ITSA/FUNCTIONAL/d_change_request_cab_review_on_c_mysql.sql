SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.cab_review_on_c' ELSE 'SUCCESS' END as Message  FROM bbandt_mdsdb.change_request_final SRC  LEFT JOIN bbandt_mdwdb.d_change_request TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) 
WHERE convert_tz(coalesce(SRC.u_cab_review_date),"UTC","America/New_York")<> TRGT.cab_review_on_c;  
