



SELECT CASE WHEN  (count_mds = count_dwh) THEN 'SUCCESS' ELSE 'FAILURE' END AS Result
,CASE WHEN (count_mds =count_dwh) THEN 'Data Matched'
ELSE CONCAT( 'MDS-DWH RowCount did not Match for ', DWH.Table_DWH , '. MDS:',count_mds,'DWH : ' ,DWH.Count_DWH)
END AS Message
FROM (SELECT (SELECT COUNT(1) FROM #MDS_TABLE_SCHEMA.core_company_final) + (SELECT COUNT(1) FROM #MDS_TABLE_SCHEMA.cmn_department_final) +
 (SELECT COUNT(1) FROM #MDS_TABLE_SCHEMA.sys_user_group_final)

 AS count_mds) MDS,
(SELECT COUNT(1) Count_DWH, 'd_internal_organization'  Table_DWH 
FROM #DWH_TABLE_SCHEMA.d_internal_organization WHERE row_key NOT IN (0,-1) and soft_deleted_flag='N') DWH



