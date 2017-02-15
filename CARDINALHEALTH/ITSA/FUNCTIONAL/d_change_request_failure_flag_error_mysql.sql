
SELECT CASE 
         WHEN CNT > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN CNT > 0 THEN 
         'MDS to DWH data validation failed for f_change_request.failure_flag' 
         ELSE 'SUCCESS' 
       END AS Message 
	   FROM (SELECT count(1) as CNT
FROM   cardinalhealth_mdwdb.f_change_request SRC 
       LEFT JOIN cardinalhealth_mdwdb.d_change_request TRGT 
              ON ( TRGT.row_key=SRC.change_request_key) 
       
WHERE  CASE WHEN SRC.success_status_src_code_c LIKE '%fail%' THEN 'Y' ELSE 'N' END
       <> TRGT.failure_flag)temp;
	   
