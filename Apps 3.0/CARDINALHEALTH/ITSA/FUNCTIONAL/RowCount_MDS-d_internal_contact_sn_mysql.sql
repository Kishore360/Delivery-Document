SELECT CASE WHEN  (count_mds = count_dwh) THEN 'SUCCESS' ELSE 'FAILURE' END AS Result
,CASE WHEN (count_mds =count_dwh) THEN 'Data Matched'
ELSE CONCAT( 'MDS-DWH RowCount did not Match for ', DWH.Table_DWH , '. MDS:',count_mds,'DWH : ' ,DWH.Count_DWH)
END AS Message
FROM (SELECT (SELECT COUNT(1) FROM cardinalhealth_mdsdb.sys_user_final ) AS count_mds ) MDS,
(SELECT COUNT(1) Count_DWH, 'd_internal_contact'  Table_DWH 
FROM cardinalhealth_mdwdb.d_internal_contact WHERE row_key NOT IN (0,-1)  and current_flag='Y' and source_id =2
AND soft_deleted_flag='N') DWH
