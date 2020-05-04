SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_sa_techportfolio_products_c.support_end_date' ELSE 'SUCCESS' END as Message
 FROM bbandt_mdsdb.sa_techportfolio_products_final src 
 join bbandt_mdwdb.d_sa_techportfolio_products_c trgt
  ON trgt.row_id = src.name
  and trgt.source_id = src.sourceinstance
 WHERE  coalesce(src.support_end_date,'UNSPECIFIED') <> trgt.support_end_date
 and src.cdctype='X';