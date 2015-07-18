
SELECT CASE WHEN  (count_mds = count_dwh) THEN 'SUCCESS' ELSE 'FAILURE' END AS Result
,CASE WHEN (count_mds =count_dwh) THEN 'Data Matched'
ELSE CONCAT( 'MDS-DWH RowCount did not Match for ', DWH.Table_DWH , '. MDS:',count_mds,'DWH : ' ,DWH.Count_DWH)
END AS Message
FROM (SELECT (SELECT COUNT(1) FROM <<tenant>>_mdsdb.employee_final) + (SELECT COUNT(1) FROM <<tenant>>_mdsdb.sys_user_final) ) MDS,
(SELECT COUNT(1) Count_DWH, 'd_internal_contact'  Table_DWH 
FROM <<tenant>>_mdwdb.d_internal_contact WHERE row_key not in (0,-1)) DWH
