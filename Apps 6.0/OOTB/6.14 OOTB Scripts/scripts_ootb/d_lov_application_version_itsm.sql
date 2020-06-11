SELECT CASE WHEN count(1) = 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1)=0 THEN 'APPLICATION_VERSION not available for TENANT_INFORMATION' ELSE 'SUCCESS' END as Message
from
(select * from #DWH_TABLE_SCHEMA.d_lov )SRC
where dimension_class='TENANT_INFORMATION'
and dimension_type='APPLICATION_VERSION'
