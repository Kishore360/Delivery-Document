
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request.assigned_to_key' ELSE 'SUCCESS' END as Message
FROM nbcu_mdwdb.d_location TRGT
 join  nbcu_mdwdb.d_lov LKP
 on TRGT.country_code = LKP.dimension_code
 and LKP.dimension_class = 'Country_WH~Geo'
 where LKP.dimension_name<> TRGT.country_name_c
