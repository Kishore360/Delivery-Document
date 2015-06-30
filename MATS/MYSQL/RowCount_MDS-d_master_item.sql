

SELECT CASE WHEN  (count_mds = Count_DWH) THEN 'SUCCESS' ELSE 'FAILURE' END AS Result
,CASE WHEN (count_mds =Count_DWH) THEN 'Data Matched'
ELSE CONCAT( 'MDS-DWH RowCount did not Match for d_master_item. MDS:',count_mds,'DWH : ' ,Count_DWH)
END AS Message from(
select count_mds,Count_DWH  from(
SELECT COUNT(1) as count_mds FROM <<tenant>>_mdsdb.sc_cat_item_final
where not exists (
 SELECT table_rows FROM information_schema.TABLES WHERE TABLE_SCHEMA='<<tenant>>_mdsdb' AND TABLE_NAME='discountitem_final'
UNION ALL
SELECT table_rows FROM information_schema.TABLES WHERE TABLE_SCHEMA='<<tenant>>_mdsdb' AND TABLE_NAME='servicesaleitem_final' 
UNION ALL
SELECT table_rows FROM information_schema.TABLES WHERE TABLE_SCHEMA='<<tenant>>_mdsdb' AND TABLE_NAME='serviceresaleitem_final' 
UNION ALL
SELECT table_rows FROM information_schema.TABLES WHERE TABLE_SCHEMA='<<tenant>>_mdsdb' AND TABLE_NAME='salestaxitem_final' 
UNION ALL
SELECT table_rows FROM information_schema.TABLES WHERE TABLE_SCHEMA='<<tenant>>_mdsdb' AND TABLE_NAME='giftcertificateitem_final' 
UNION ALL
SELECT table_rows FROM information_schema.TABLES WHERE TABLE_SCHEMA='<<tenant>>_mdsdb' AND TABLE_NAME='itemgroup_final' 
UNION ALL
SELECT table_rows FROM information_schema.TABLES WHERE TABLE_SCHEMA='<<tenant>>_mdsdb' AND TABLE_NAME='descriptionitem_final' 
UNION ALL
SELECT table_rows FROM information_schema.TABLES WHERE TABLE_SCHEMA='<<tenant>>_mdsdb' AND TABLE_NAME='downloaditem_final' 
UNION ALL
SELECT table_rows FROM information_schema.TABLES WHERE TABLE_SCHEMA='<<tenant>>_mdsdb' AND TABLE_NAME='markupitem_final' 
UNION ALL
SELECT table_rows FROM information_schema.TABLES WHERE TABLE_SCHEMA='<<tenant>>_mdsdb' AND TABLE_NAME='paymentitem_final' 
UNION ALL
SELECT table_rows FROM information_schema.TABLES WHERE TABLE_SCHEMA='<<tenant>>_mdsdb' AND TABLE_NAME='subtotalitem_final' 
UNION ALL
SELECT table_rows FROM information_schema.TABLES WHERE TABLE_SCHEMA='<<tenant>>_mdsdb' AND TABLE_NAME='noninventorypurchaseitem_final' 
UNION ALL
SELECT table_rows FROM information_schema.TABLES WHERE TABLE_SCHEMA='<<tenant>>_mdsdb' AND TABLE_NAME='noninventoryresaleitem_final' 
UNION ALL
SELECT table_rows FROM information_schema.TABLES WHERE TABLE_SCHEMA='<<tenant>>_mdsdb' AND TABLE_NAME='otherchargeresaleitem_final' 
UNION ALL
SELECT table_rows FROM information_schema.TABLES WHERE TABLE_SCHEMA='<<tenant>>_mdsdb' AND TABLE_NAME='otherchargepurchaseitem_final' 
UNION ALL
SELECT table_rows FROM information_schema.TABLES WHERE TABLE_SCHEMA='<<tenant>>_mdsdb' AND TABLE_NAME='servicepurchaseitem_final' 
UNION ALL
SELECT table_rows FROM information_schema.TABLES WHERE TABLE_SCHEMA='<<tenant>>_mdsdb' AND TABLE_NAME='assemblyitem_final' 
UNION ALL
SELECT table_rows FROM information_schema.TABLES WHERE TABLE_SCHEMA='<<tenant>>_mdsdb' AND TABLE_NAME='kititem_final' 
UNION ALL
SELECT table_rows FROM information_schema.TABLES WHERE TABLE_SCHEMA='<<tenant>>_mdsdb' AND TABLE_NAME='noninventorysaleitem_final' 
UNION ALL
SELECT table_rows FROM information_schema.TABLES WHERE TABLE_SCHEMA='<<tenant>>_mdsdb' AND TABLE_NAME='otherchargesaleitem_final' 
UNION ALL
SELECT table_rows FROM information_schema.TABLES WHERE TABLE_SCHEMA='<<tenant>>_mdsdb' AND TABLE_NAME='inventoryitem_final' 
UNION ALL
SELECT table_rows FROM information_schema.TABLES WHERE TABLE_SCHEMA='<<tenant>>_mdsdb' AND TABLE_NAME='taxgroup_final' ))dfg,
(SELECT COUNT(1) Count_DWH, 'd_master_item'  Table_DWH 
FROM <<tenant>>_mdwdb.d_master_item WHERE row_key NOT IN (0,-1))  DWH
)ghi