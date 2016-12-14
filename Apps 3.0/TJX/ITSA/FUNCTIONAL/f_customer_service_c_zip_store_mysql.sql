 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.location_key' ELSE 'SUCCESS' END as Message
 FROM tjx_mdsdb.u_customer_service_final SRC
LEFT JOIN tjx_mdsdb.u_location_store_final LKP5 
ON SRC.u_store = LKP5.sys_id 
 inner join tjx_mdwdb.f_customer_service_c TGT
on TGT.row_id=SRC.sys_id
where 
TGT.zip_c <> LKP5.zip or
TGT.store_c <> CONCAT(LKP5.u_reference_name,'-',LKP5.name) or 
TGT.social_handle_c <> SRC.u_social_handle or
TGT.advertisement_c <> SRC.u_advertisement or
TGT.subcategory_c <> SRC.u_subcategory or
SRC.number <> TGT.customer_service_number_c

