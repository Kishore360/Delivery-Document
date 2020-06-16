
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,

CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.model_id ' 
ELSE 'SUCCESS' END as Message
 FROM 

(


SELECT count(1) as CNT
 
FROM equifax_mdsdb.cmdb_ci_final SRC 

LEFT JOIN equifax_mdwdb.d_product_model LKP 
ON 
(SRC.model_id= LKP.row_id AND SRC.sourceinstance=LKP.source_id)

LEFT JOIN equifax_mdwdb.d_configuration_item TRGT
  
ON (SRC.sys_id= TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
 
 where (coalesce(CASE WHEN SRC.model_id is NULL THEN 0 END,LKP.row_key,-1))<>TRGT.ci_model_id_c_key
  and SRC.cdctype ='X')temp