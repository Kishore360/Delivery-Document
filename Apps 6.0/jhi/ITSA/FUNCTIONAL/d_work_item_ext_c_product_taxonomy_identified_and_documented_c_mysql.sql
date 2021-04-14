SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_work_item_ext_c.product_taxonomy_identified_and_documented_c' ELSE 'SUCCESS' END as Message 
FROM jhi_mdsdb.issue_final  SRC 
JOIN jhi_mdwdb.d_work_item_ext_c TRGT ON 
SRC.id = TRGT.row_id and SRC.sourceinstance = TRGT.source_id
WHERE  
SRC.Product_Taxonomy_Identified_and_documented_c  <> (TRGT.product_taxonomy_identified_and_documented_c) and TRGT.soft_deleted_flag ='N';