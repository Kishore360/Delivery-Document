SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_application.mdm_key' ELSE 'SUCCESS' END as Message     
from
#DWH_TABLE_SCHEMA.d_application CA
left join #DWH_TABLE_SCHEMA.d_application SN
on SN.name = CA.name and SN.source_id <> CA.source_id
where CA.row_key not in (0,-1) and 
 CA.mdm_key  <> (case when SN.source_id = '2' then SN.row_key else COALESCE(CA.row_key,SN.row_key) end);