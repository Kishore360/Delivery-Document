
SELECT CASE WHEN  (count_mds+2 = count_dwh) THEN 'SUCCESS' ELSE 'FAILURE' END AS Result
,CASE WHEN (count_mds +2 = count_dwh) THEN 'Data Matched'
ELSE CONCAT( 'RowCount did not Match. ', MDS.Table_MDS
,' : ' ,MDS.Count_MDS, ' , ' ,DWH.Table_DWH , ' : ' ,DWH.Count_DWH)
END AS Message
FROM
(SELECT 
(SELECT COUNT(*) Count_MDS 
FROM  #MDS_TABLE_SCHEMA.pm_project_final WHERE CDCTYPE<>'D') 
+
(SELECT COUNT(*) Count_MDS 
FROM  #MDS_TABLE_SCHEMA.pm_project_task_final WHERE CDCTYPE<>'D') 

Count_MDS
, 'pm_project_final+pm_project_task_final' Table_MDS
) MDS,
(SELECT COUNT(*) Count_DWH, 'd_project'  Table_DWH 
FROM #DWH_TABLE_SCHEMA.d_project
WHERE soft_deleted_flag = 'N') DWH