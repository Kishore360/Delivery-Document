SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_request_item.configuration_item_key' ELSE 'SUCCESS' END as Message
FROM (
select count(1) as cnt
from usf_mdwdb.d_lov
where 
row_id <> concat(dimension_class,'~',dimension_type,'~',dimension_subtype,'~',dimension_code)
and dimension_class not in ('LANDING_PAGE','TENANT_INFORMATION')
and row_key not in (-1,0)
and dimension_class not in ('CATEGORY~INCIDENT','ROLE_C~INTERNAL_CONTACT')
)a;
