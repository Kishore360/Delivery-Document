			
				
				
				SELECT 
CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 

CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_change_failure.u_morotonium_conflict_c' ELSE 'SUCCESS' END as Message 

FROM 
(select count(1) as cnt from 

ntrust_mdsdb.change_request_final  SRC 

JOIN ntrust_mdwdb.d_change_failure TRGT 
ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id ) 
 
WHERE  coalesce(case  
                    when SRC.u_moratorium_conflict = 'Yes' then 'Y' 
                    when SRC.u_moratorium_conflict  = 'No' then 'N' 
                    else 'X' 
                end,
                'X') <> (TRGT.u_moratorium_conflict_c
) and TRGT.current_flag='Y' and SRC.cdctype='X'  ) temp;
