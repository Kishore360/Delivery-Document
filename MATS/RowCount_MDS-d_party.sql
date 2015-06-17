



SELECT CASE WHEN  (count_mds = count_dwh) THEN 'SUCCESS' ELSE 'FAILURE' END AS Result
,CASE WHEN (count_mds =count_dwh) THEN 'Data Matched'
ELSE CONCAT( 'MDS-DWH RowCount did not Match for ', DWH.Table_DWH , '. MDS:',count_mds,'DWH : ' ,DWH.Count_DWH)
END AS Message
FROM (SELECT (SELECT COUNT(1) FROM <<tenant>>_mdsdb.core_company_final) + (SELECT COUNT(1) FROM <<tenant>>_mdsdb.vendor_final) + 
(SELECT COUNT(1) FROM <<tenant>>_mdsdb.core_company_final WHERE customer=1 ) + ( SELECT COUNT(1) FROM <<tenant>>_mdsdb.customer_final )
 + (SELECT COUNT(1) FROM <<tenant>>_mdsdb.employee_final ) + ( SELECT COUNT(1) FROM <<tenant>>_mdsdb.sys_user_final ) AS count_mds) MDS,
(SELECT COUNT(1) Count_DWH, 'd_party'  Table_DWH 
FROM <<tenant>>_mdwdb.d_party WHERE row_key NOT IN (0,-1)) DWH
