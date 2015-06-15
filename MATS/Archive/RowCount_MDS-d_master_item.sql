



SELECT CASE WHEN  (count_mds = count_dwh) THEN 'SUCCESS' ELSE 'FAILURE' END AS Result
,CASE WHEN (count_mds =count_dwh) THEN 'Data Matched'
ELSE CONCAT( 'MDS-DWH RowCount did not Match for ', DWH.Table_DWH , '. MDS:',count_mds,'DWH : ' ,DWH.Count_DWH)
END AS Message
FROM (SELECT (SELECT * FROM( SELECT table_rows FROM information_schema.TABLES WHERE TABLE_SCHEMA='#MDS_TABLE_SCHEMA' AND TABLE_NAME='discountitem_final'
UNION ALL
SELECT table_rows FROM information_schema.TABLES WHERE TABLE_SCHEMA='#MDS_TABLE_SCHEMA' AND TABLE_NAME='servicesaleitem_final' 
UNION ALL
SELECT table_rows FROM information_schema.TABLES WHERE TABLE_SCHEMA='#MDS_TABLE_SCHEMA' AND TABLE_NAME='serviceresaleitem_final' 
UNION ALL
SELECT table_rows FROM information_schema.TABLES WHERE TABLE_SCHEMA='#MDS_TABLE_SCHEMA' AND TABLE_NAME='salestaxitem_final' 
UNION ALL
SELECT table_rows FROM information_schema.TABLES WHERE TABLE_SCHEMA='#MDS_TABLE_SCHEMA' AND TABLE_NAME='giftcertificateitem_final' 
UNION ALL
SELECT table_rows FROM information_schema.TABLES WHERE TABLE_SCHEMA='#MDS_TABLE_SCHEMA' AND TABLE_NAME='itemgroup_final' 
UNION ALL
SELECT table_rows FROM information_schema.TABLES WHERE TABLE_SCHEMA='#MDS_TABLE_SCHEMA' AND TABLE_NAME='descriptionitem_final' 
UNION ALL
SELECT table_rows FROM information_schema.TABLES WHERE TABLE_SCHEMA='#MDS_TABLE_SCHEMA' AND TABLE_NAME='downloaditem_final' 
UNION ALL
SELECT table_rows FROM information_schema.TABLES WHERE TABLE_SCHEMA='#MDS_TABLE_SCHEMA' AND TABLE_NAME='markupitem_final' 
UNION ALL
SELECT table_rows FROM information_schema.TABLES WHERE TABLE_SCHEMA='#MDS_TABLE_SCHEMA' AND TABLE_NAME='paymentitem_final' 
UNION ALL
SELECT table_rows FROM information_schema.TABLES WHERE TABLE_SCHEMA='#MDS_TABLE_SCHEMA' AND TABLE_NAME='subtotalitem_final' 
UNION ALL
SELECT table_rows FROM information_schema.TABLES WHERE TABLE_SCHEMA='#MDS_TABLE_SCHEMA' AND TABLE_NAME='noninventorypurchaseitem_final' 
UNION ALL
SELECT table_rows FROM information_schema.TABLES WHERE TABLE_SCHEMA='#MDS_TABLE_SCHEMA' AND TABLE_NAME='noninventoryresaleitem_final' 
UNION ALL
SELECT table_rows FROM information_schema.TABLES WHERE TABLE_SCHEMA='#MDS_TABLE_SCHEMA' AND TABLE_NAME='otherchargeresaleitem_final' 
UNION ALL
SELECT table_rows FROM information_schema.TABLES WHERE TABLE_SCHEMA='#MDS_TABLE_SCHEMA' AND TABLE_NAME='otherchargepurchaseitem_final' 
UNION ALL
SELECT table_rows FROM information_schema.TABLES WHERE TABLE_SCHEMA='#MDS_TABLE_SCHEMA' AND TABLE_NAME='servicepurchaseitem_final' 
UNION ALL
SELECT table_rows FROM information_schema.TABLES WHERE TABLE_SCHEMA='#MDS_TABLE_SCHEMA' AND TABLE_NAME='assemblyitem_final' 
UNION ALL
SELECT table_rows FROM information_schema.TABLES WHERE TABLE_SCHEMA='#MDS_TABLE_SCHEMA' AND TABLE_NAME='kititem_final' 
UNION ALL
SELECT table_rows FROM information_schema.TABLES WHERE TABLE_SCHEMA='#MDS_TABLE_SCHEMA' AND TABLE_NAME='noninventorysaleitem_final' 
UNION ALL
SELECT table_rows FROM information_schema.TABLES WHERE TABLE_SCHEMA='#MDS_TABLE_SCHEMA' AND TABLE_NAME='otherchargesaleitem_final' 
UNION ALL
SELECT table_rows FROM information_schema.TABLES WHERE TABLE_SCHEMA='#MDS_TABLE_SCHEMA' AND TABLE_NAME='inventoryitem_final' 
UNION ALL
SELECT table_rows FROM information_schema.TABLES WHERE TABLE_SCHEMA='#MDS_TABLE_SCHEMA' AND TABLE_NAME='taxgroup_final' )dfg)
+
(SELECT COUNT(*) FROM #MDS_TABLE_SCHEMA.sc_cat_item_final) AS count_mds) MDS,
(SELECT COUNT(*) Count_DWH, 'd_master_item'  Table_DWH 
FROM #TABLE_SCHEMA.d_master_item WHERE row_key NOT IN (0,-1))  DWH


