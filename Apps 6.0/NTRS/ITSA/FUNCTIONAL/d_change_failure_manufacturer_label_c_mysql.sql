	
				SELECT 
CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 

CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_change_failure.manufacturer_label_c' ELSE 'SUCCESS' END as Message 

FROM 
(select count(1) as cnt from 

 ntrust_mdsdb.change_request_final  SRC 
JOIN
               ntrust_mdsdb.cmdb_ci_final cmdb_ci 
                    ON SRC.cmdb_ci=cmdb_ci.sys_id 
                    and SRC.sourceinstance=cmdb_ci.sourceinstance 
					JOIN
                ntrust_mdsdb.core_company_final core_company 
                    ON cmdb_ci.manufacturer=core_company.sys_id 
                    and cmdb_ci.sourceinstance=core_company.sourceinstance 

JOIN ntrust_mdwdb.d_change_failure TRGT 
ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id ) 
 
WHERE   coalesce(core_company.name,
                'UNSPECIFIED') <> (TRGT.manufacturer_label_c) and TRGT.current_flag='Y' and SRC.cdctype='X'  and SRC.cdctime<=TRGT.dw_inserted_on  ) temp;