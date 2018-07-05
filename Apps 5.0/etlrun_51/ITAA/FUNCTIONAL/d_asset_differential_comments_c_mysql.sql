SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_incident.opened_on' ELSE 'SUCCESS' END as Message from 
(select count(1) as cnt 
 FROM wow_mdsdb.alm_asset_final SRC 
 LEFT JOIN wow_mdwdb.d_asset TRGT 
 ON ( CONCAT('ASSET~',SRC.sys_id)=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id) 
  WHERE SRC.u_differential_comments<> TRGT.differential_comments_c)t;
