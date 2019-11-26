

SELECT

CASE WHEN count(1) THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) THEN 'MDS to DWH data validation failed for d_rita_application_c.rita_app_other_supplier_code' ELSE 'SUCCESS' END as Message


FROM 
(
select app_hexid,GROUP_CONCAT(distinct organization_name order by organization_name) as organization_name,
GROUP_CONCAT(distinct cardinal order by organization_name) as cardinal ,sourceinstance from
(
select app.name as app_hexid, responsible_org_unit,
CASE WHEN cardinal is null or cardinal='' or cardinal=responsible_org_unit then responsible_org_unit 
else LEFT(replace(replace(responsible_org_unit,CONCAT(' - ',cardinal),''),cardinal,'') ,255) end as organization_name, cardinal
,app.sourceinstance from (
png_mdsdb.pg_mega_pgb_application_rita_final app
left join (select app_hexid,responsible_org_unit_hexid,responsible_org_unit,sourceinstance,count(1) from png_mdsdb.pg_mega_pgv_app_responsible_org_person_final 
where (third_party_with_access <>'No' AND third_party_with_access is not null) and app_hexid is not null and responsible_org_unit_hexid is not null
and cdctype='X' 
group by 1,2,3,4)org
on app.name=org.app_hexid and app.sourceinstance=org.sourceinstance 
left join (select distinct name,LEFT((cardinal),255) as CARDINAL from  png_mdsdb.pg_mega_pgb_org_unit_final
where  (cardinal is not null and cardinal<>'') 
) as organization 
on responsible_org_unit_hexid = organization.name and cdctype ='X'
))Z
group by app_hexid

) SRC1  
LEFT JOIN 
png_mdwdb.d_rita_application_c TRGT ON SRC1.app_hexid=TRGT.row_id AND SRC1.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC1.CARDINAL,'UNSPECIFIED')<>TRGT.rita_app_other_supplier_code 