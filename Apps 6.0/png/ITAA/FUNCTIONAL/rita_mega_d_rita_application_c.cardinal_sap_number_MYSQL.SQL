SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.cardinal_sap_number' ELSE 'SUCCESS' END as Message
FROM 
(
select count(1) as CNT
from
(select u_pg_source_system_id,GROUP_CONCAT(distinct organization_name order by organization_name ) as organization_name,
GROUP_CONCAT(distinct cardinal order by organization_name) as cardinal ,sourceinstance from
(
select a.u_pg_source_system_id as u_pg_source_system_id, responsible_org_unit,
CASE WHEN cardinal is null or cardinal='' or cardinal=responsible_org_unit then responsible_org_unit 
else LEFT(replace(replace(responsible_org_unit,CONCAT(' - ',cardinal),''),cardinal,'') ,255) end as organization_name, cardinal
,a.sourceinstance from (
png_mdsdb.pg_mega_cmdb_ci_appl_final a
join 
(select app_hexid,responsible_org_unit_hexid,responsible_org_unit,sourceinstance,count(1) from png_mdsdb.pg_mega_pgv_app_responsible_org_person_final 
where (((third_party_with_access <>'No' AND third_party_with_access is not null)
or (pg_software_supplier  <>'N' AND pg_software_supplier is not null)
or (pg_service_manager_supplier <>'N' AND pg_service_manager_supplier is not null)
or (pg_implementation_supplier <>'N' AND pg_implementation_supplier is not null)
or (supplier <>'N' AND supplier is not null))) and app_hexid is not null and responsible_org_unit_hexid is not null
and cdctype='X' 
group by 1,2,3,4) c
on (a.u_pg_source_system_id=c.app_hexid and a.sourceinstance=c.sourceinstance)
join 
(select name, LEFT((cardinal),255) as cardinal
from png_mdsdb.pg_mega_pgb_org_unit_final
where cardinal is not null and cardinal<>'') d
on (c.responsible_org_unit_hexid=d.name)
)) e
group by u_pg_source_system_id) f
join png_mdwdb.d_rita_application_c g
on (f.u_pg_source_system_id=g.mega_id and f.sourceinstance=g.source_id)
where g.cardinal_sap_number<>COALESCE(f.cardinal,'UNSPECIFIED')
) temp;







