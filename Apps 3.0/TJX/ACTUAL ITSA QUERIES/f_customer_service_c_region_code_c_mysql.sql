SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_customer_service_c.region_code_c_key' ELSE 'SUCCESS' END as Message,
count(1) FROM tjx_mdsdb.u_customer_service_final SRC
inner join tjx_mdwdb.f_customer_service_c TGT
on TGT.row_id=SRC.sys_id and SRC.sourceinstance=TGT.source_id
INNER JOIN tjx_mdsdb.u_location_store_final LKP1
ON SRC.u_store = LKP1.sys_id and SRC.sourceinstance=LKP1.sourceinstance
INNER JOIN tjx_mdsdb.u_location_district_final LKP2
ON LKP1.u_district = LKP2.sys_id and SRC.sourceinstance=LKP2.sourceinstance
INNER JOIN tjx_mdsdb.u_location_region_final LKP3
ON LKP2.u_region = LKP3.sys_id and SRC.sourceinstance=LKP3.sourceinstance
where TGT.region_code_c <> LKP3.u_id;

