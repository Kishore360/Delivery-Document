SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_incident.opened_on' ELSE 'SUCCESS' END as Message from 
(select count(1) cnt  
 FROM  usf_mdsdb.alm_asset_final SRC   
 JOIN usf_mdwdb.d_asset TRGT  
 ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) 
 WHERE convert_tz(SRC.u_deployed,'GMT'','US/Pacific')<> TRGT.deployed_date_c)b;
