SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_project_c.dts_bio_business_area' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_project_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_prj_data_qlkview_final src
on src.investment_id = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.dts_bio_business_area <>src.DTS_BIO_Business_Area;