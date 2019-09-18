SELECT CASE WHEN count(1) = 3 THEN 'SUCCESS' ELSE 'FAILURE' END as Result,
 CASE WHEN count(1) =3 THEN 'SUCCESS' ELSE 'Dimension classes not configured in LSM LS System Variables:Ignore Category and Subcategory for TJX' END as Message
 FROM(

select distinct dimension_class,source_id
from mcdonalds_mdwdb.d_lov lov where  source_id=2 and dimension_class 
 in (select 'U_SUBCATEGORY_LOV_C~INCIDENT'as dimension_class  from mcdonalds_mdsdb.u_subcategory_final)
union
select distinct dimension_class,source_id
from mcdonalds_mdwdb.d_lov lov where  source_id=2 and dimension_class 
 in (select 'LEGACY_CI_NAME_C~INCIDENT'as dimension_class  from mcdonalds_mdsdb.u_legacy_configuration_item_final)
union
select distinct dimension_class,source_id
from mcdonalds_mdwdb.d_lov lov where  source_id=2 and dimension_class 
 in (select 'WORKPLACE_LOCATION_C~INCIDENT'as dimension_class  from mcdonalds_mdsdb.u_integration_srms_location_final)




 )a;
