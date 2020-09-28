
				
				SELECT 
CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 

CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_change_failure.Risk_and_Impact_Analysis_Length_C' ELSE 'SUCCESS' END as Message 

FROM 
(select count(1) as cnt from 

ntrust_mdsdb.change_request_final  SRC 

JOIN ntrust_mdwdb.d_change_failure TRGT 
ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id ) 
 
WHERE  coalesce(char_length(REPLACE(SRC.risk_impact_analysis,
                ' ',
                '')),
                -1) <> (TRGT.Risk_and_Impact_Analysis_Length_C) and TRGT.current_flag='Y' ) temp;