SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_customer_service_c.region_code_c_key' ELSE 'SUCCESS' END as Message,
count(1) FROM tjx_mdsdb.u_customer_service_final SRC
inner join tjx_mdwdb.f_customer_service_c TGT
on TGT.row_id=SRC.sys_id and SRC.sourceinstance=TGT.source_id
INNER JOIN tjx_mdsdb.u_location_store_final LKP1
ON SRC.u_store = LKP1.sys_id and SRC.sourceinstance=LKP1.sourceinstance
where TGT.store_code_c <> LKP1.u_id;

