SELECT 
CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1) THEN 'MDS to DWH data validation failed for d_work_item.Business_Unit_c' ELSE 'SUCCESS' END as Message 
FROM jhi_mdsdb.xraytest_set_final SRC   
JOIN jhi_mdwdb.d_work_item TRGT 
ON SRC.issueID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC.issueID, 'UNSPECIFIED') <> (TRGT.row_id) and TRGT.soft_deleted_flag ='N';



 