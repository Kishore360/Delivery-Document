SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) THEN 'MDS to DWH data validation failed for f_work_item.standard_environment_usage_c' ELSE 'SUCCESS' END as Message
FROM jhi_mdwdb.d_work_item_ext_c TRGT
JOIN jhi_mdwdb.f_work_item LKP on LKP.work_item_key=TRGT.work_item_c_key
WHERE CASE WHEN TRGT.standard_environment_usage_c LIKE ('%Dev%') THEN 1
WHEN TRGT.standard_environment_usage_c LIKE ('%Test%') THEN 1
WHEN TRGT.standard_environment_usage_c LIKE ('%Prod%') THEN 1
WHEN TRGT.standard_environment_usage_c LIKE ('%Acc%') THEN 1 ELSE 0 END  <> (LKP.standard_environment_usage_c) and LKP.soft_deleted_flag ='N';