SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.rita_app_software_supplier_name' ELSE 'SUCCESS' END as Message
FROM 
(
select count(1) as CNT
from
png_mdwdb.d_rita_application_c d_rita_application_c
join
(select group_concat(distinct CASE 
                WHEN u_ci_responsible_vendor.u_role='Software Supplier' THEN d_internal_organization.organization_name 
                else '' 
            END 
        order by
            1 asc) as software_supplier, SRC.row_key as row_key
from png_mdsdb.pg_mega_u_ci_responsible_vendor_final u_ci_responsible_vendor
join 
(select  organization_name, row_id, source_id from
png_mdwdb.d_internal_organization d_internal_organization) d_internal_organization 			
on ((COALESCE(CONCAT('SUBSIDIARY~',u_ci_responsible_vendor.u_vendor),'UNSPECIFIED'))=d_internal_organization.row_id and d_internal_organization.source_id=2)
join
(select row_id, source_id, cdctype, max(row_key) as row_key from png_mdwdb.d_rita_application_c group by 1,2,3) SRC
on (u_ci_responsible_vendor.u_configuration_item=SRC.row_id and u_ci_responsible_vendor.sourceinstance=SRC.source_id)
group by SRC.row_key) SRC1
on (d_rita_application_c.row_key=SRC1.row_key)
where
d_rita_application_c.rita_app_software_supplier_name=
CASE 
WHEN SRC1.software_supplier LIKE ',%' THEN REPLACE(SRC1.software_supplier,
',',
'')  
WHEN SRC1.software_supplier ='' THEN 'UNSPECIFIED' ELSE SRC1.software_supplier END
) temp;

 


