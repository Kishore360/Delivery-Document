SELECT CASE WHEN count(1) THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) THEN 'MDS to DWH data validation failed for f_work_item.row_count_c' ELSE 'SUCCESS' END as Message
FROM jhi_mdwdb.d_work_item_ext_c TRGT
JOIN jhi_mdwdb.f_work_item LKP on LKP.work_item_key=TRGT.work_item_c_key
WHERE LKP.row_key <> (LKP.row_count_c) and LKP.soft_deleted_flag ='N';