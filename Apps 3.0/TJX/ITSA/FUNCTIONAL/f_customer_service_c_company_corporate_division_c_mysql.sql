SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_customer_service_c.customer_service_category_c_key' ELSE 'SUCCESS' END as Message
FROM 
tjx_mdsdb.u_customer_service_final SRC
LEFT JOIN tjx_mdsdb.u_company_corporate_division_final LKP5 
ON SRC.u_chain = LKP5.sys_id  and SRC.sourceinstance=LKP5.sourceinstance
inner join tjx_mdwdb.f_customer_service_c TGT
on TGT.row_id=SRC.sys_id and SRC.sourceinstance=TGT.source_id
where TGT.company_corporate_division_c<> LKP5.name;




