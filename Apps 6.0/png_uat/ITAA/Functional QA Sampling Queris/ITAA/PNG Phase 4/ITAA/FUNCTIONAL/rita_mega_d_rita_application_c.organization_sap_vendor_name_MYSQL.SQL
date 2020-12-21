SELECT 
CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN COUNT(1) > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.organization_sap_vendor_name' ELSE 'SUCCESS' END as Message
FROM 
(
select app_hexid,sourceinstance,GROUP_CONCAT(distinct organization_name order by organization_name ) as organization_name,
GROUP_CONCAT(distinct cardinal order by organization_name) as cardinal  from
(select app.name as app_hexid, responsible_org_unit,
CASE WHEN cardinal is null or cardinal='' or cardinal=responsible_org_unit then responsible_org_unit 
else LEFT(replace(replace(responsible_org_unit,CONCAT(' - ',cardinal),''),cardinal,'') ,255) end as organization_name, cardinal
,app.sourceinstance from (
png_mdsdb.pg_mega_pgb_application_rita_final app
left join (select app_hexid,responsible_org_unit_hexid,responsible_org_unit,sourceinstance,count(1) from png_mdsdb.pg_mega_pgv_app_responsible_org_person_final 
where (((third_party_with_access <>'No' AND third_party_with_access is not null)
or (pg_software_supplier  <>'N' AND pg_software_supplier is not null)
or (pg_service_manager_supplier <>'N' AND pg_service_manager_supplier is not null)
or (pg_implementation_supplier <>'N' AND pg_implementation_supplier is not null)
or (supplier <>'N' AND supplier is not null))) and app_hexid is not null and responsible_org_unit_hexid is not null
and cdctype='X' 
group by 1,2,3,4)org
on app.name=org.app_hexid and app.sourceinstance=org.sourceinstance 
left join (select distinct name,LEFT((cardinal),255) as CARDINAL from  png_mdsdb.pg_mega_pgb_org_unit_final
where  (cardinal is not null and cardinal<>'') 
) as organization 
on responsible_org_unit_hexid = organization.name 
))Z
group by app_hexid,sourceinstance


) X
LEFT JOIN png_mdwdb.d_rita_application_c TRGT ON X.app_hexid=TRGT.row_id AND X.sourceinstance=TRGT.source_id
WHERE COALESCE(X.organization_name,'UNSPECIFIED')<>TRGT.organization_sap_vendor_name
AND cdctype <> 'D'
