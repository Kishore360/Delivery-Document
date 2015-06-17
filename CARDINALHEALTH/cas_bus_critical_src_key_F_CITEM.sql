SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select  count(*) as cnt from cardinalhealth_workdb.dwh_d_configuration_item f
left outer join cardinalhealth_workdb.dwh_d_lov l on f.cah_bus_criticl_src_code_c = l.dimension_code
and l.dimension_class ='U_CAH_BUSINESS_CRITICALITY~CMDB_CI_APPLICATION' 
where case when f.cah_bus_criticl_src_code_c is null then '0' else
case when  l.dimension_code is null then '-1' else l.row_key end end<>f.cah_bus_criticl_src_code_key_c 
) c;

