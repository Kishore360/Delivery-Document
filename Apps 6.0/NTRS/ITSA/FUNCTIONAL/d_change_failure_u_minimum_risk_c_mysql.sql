
				SELECT 
CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 

CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_change_failure.u_minimum_risk_c' ELSE 'SUCCESS' END as Message 

FROM 
(select count(1) as cnt from 

ntrust_mdsdb.change_request_final  SRC 

JOIN ntrust_mdwdb.d_change_failure TRGT 
ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id ) 
 
WHERE coalesce(case  
                    when SRC.u_minimum_risk = 1 then '1 - Very High' 
                    when  SRC.u_minimum_risk =2  then '2 - High' 
                    when SRC.u_minimum_risk = 3 then '3 - Moderate' 
                    when SRC.u_minimum_risk = 4 then '4 - Low' 
                    else SRC.u_minimum_risk 
                end,
                'UNSPECIFIED') <> (TRGT.u_minimum_risk_c) and TRGT.current_flag='Y' and SRC.cdctype='X'  ) temp;
				
	