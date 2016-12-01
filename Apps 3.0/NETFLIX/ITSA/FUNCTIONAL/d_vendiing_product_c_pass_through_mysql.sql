
 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_request.short_description' ELSE 'SUCCESS' END as Message
 FROM (
 select count(1)as cnt from netflix_mdsdb.u_vendiing_product_final
 join netflix_mdwdb.d_vendiing_product_c on sys_id=row_id and sourceinstance=source_id
where u_status<>status_c
or u_name<>name_c
or manufacturer_c<>u_manufacturer
or number_c<>u_number
or brand_c<>u_brand
or price_c<>u_price)b


