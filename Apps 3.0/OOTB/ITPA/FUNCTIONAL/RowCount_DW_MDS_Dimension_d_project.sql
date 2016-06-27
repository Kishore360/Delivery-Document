
SELECT CASE WHEN  (count_mds+2 = count_dwh) THEN 'SUCCESS' ELSE 'FAILURE' END AS Result
,CASE WHEN (count_mds +2 = count_dwh) THEN 'Data Matched'
ELSE CONCAT( 'RowCount did not Match. ', MDS.Table_MDS
,' : ' ,MDS.Count_MDS, ' , ' ,DWH.Table_DWH , ' : ' ,DWH.Count_DWH)
END AS Message
FROM
(SELECT 
(SELECT COUNT(1) Count_MDS 
FROM <<tenant>>_mdsdb.pm_project_final )
+
(SELECT COUNT(1) Count_MDS 
FROM <<tenant>>_mdsdb.pm_project_task_final ) 

Count_MDS
, 'pm_project_final+pm_project_task_final' Table_MDS
) MDS,
(SELECT COUNT(1) Count_DWH, 'd_project'  Table_DWH 
FROM <<tenant>>_mdwdb.d_project
WHERE soft_deleted_flag = 'N') DWH
