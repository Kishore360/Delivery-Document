SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_work_item.percent_Product_OKRs_identified_c' ELSE 'SUCCESS' END as Message 
 FROM jhi_mdsdb.issue_final  SRC 
JOIN jhi_mdwdb.d_work_item_ext_c TRGT ON 
SRC.id = TRGT.row_id and SRC.sourceinstance = TRGT.source_id
JOIN jhi_mdwdb.d_work_item TRGT2 on TRGT.work_item_c_key=TRGT2.row_key
JOIN jhi_mdwdb.f_work_item LKP on LKP.work_item_key=TRGT2.row_key
WHERE  
CASE WHEN UPPER(SRC.Product_OKRs_identified_c) ='YES' THEN 1 ELSE 0 END <>
(LKP.percent_Product_OKRs_identified_c) and LKP.soft_deleted_flag ='N';