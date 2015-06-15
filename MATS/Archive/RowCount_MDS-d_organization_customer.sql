



SELECT CASE WHEN  (count_mds = count_dwh) THEN 'SUCCESS' ELSE 'FAILURE' END AS Result
,CASE WHEN (count_mds =count_dwh) THEN 'Data Matched'
ELSE CONCAT( 'MDS-DWH RowCount did not Match for ', DWH.Table_DWH , '. MDS:',count_mds,'DWH : ' ,DWH.Count_DWH)
END AS Message
FROM (SELECT (SELECT COUNT(*) FROM #MDS_TABLE_SCHEMA.core_company_delta A WHERE A.customer=1) + (SELECT COUNT(*) FROM #MDS_TABLE_SCHEMA.customer_final) AS count_mds) MDS,
(SELECT COUNT(*) Count_DWH, 'd_organization_customer'  Table_DWH 
FROM #TABLE_SCHEMA.d_organization_customer WHERE row_key NOT IN (0,-1)) DWH



