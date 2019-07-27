Select SRC.NAME,SRC1.app_hexid,SRC1.responsible_org_unit_hexid,SRC1.responsible_org_unit,
level1.LVL3_ORG_HEX,level1.LVL3_ORG_NAME,level1.LVL2_ORG_NAME,level1.LVL1_ORG_NAME
from pandg_mdsdb.pg_mega_pgb_application_rita_final SRC
JOIN pandg_mdsdb.pg_mega_pgv_app_responsible_org_person_final SRC1 
ON (SRC.NAME=SRC1.app_hexid AND SRC.sourceinstance=SRC1.sourceinstance AND SRC1.pg_development_org='Y')
LEFT JOIN pandg_mdsdb.pg_mega_pgv_org_itam_gbs_final level1
ON SRC1.responsible_org_unit_hexid=level1.LVL3_ORG_HEX AND SRC1.sourceinstance=level1.sourceinstance
LIMIT 5;


Level1 :
Select SRC.NAME,SRC1.app_hexid,SRC1.responsible_org_unit_hexid,SRC1.Owning_Organization,
level1.LVL3_ORG_HEX,level1.LVL3_ORG_NAME,level1.LVL2_ORG_NAME,level1.LVL1_ORG_NAME
from pandg_mdsdb.pg_mega_pgb_application_rita_final SRC
LEFT JOIN 
(select a.app_hexid,a.sourceinstance,a.responsible_org_unit_hexid,
CASE WHEN Count(1) <= 1 then MAX(coalesce(a.responsible_org_unit,'UNSPECIFIED')) else 'UNKNOWN' end as 'Owning_Organization'  
from pandg_mdsdb.pg_mega_pgv_app_responsible_org_person_final a WHERE a.pg_development_org = 'Y' 
group by a.app_hexid 
) SRC1 ON (SRC.NAME=SRC1.app_hexid AND SRC.sourceinstance=SRC1.sourceinstance )
LEFT JOIN pandg_mdsdb.pg_mega_pgv_org_itam_gbs_final level1
ON SRC1.responsible_org_unit_hexid=level1.LVL1_ORG_HEX AND SRC1.sourceinstance=level1.sourceinstance;

==================================================================================================================================

Level2 :

Select SRC.NAME,SRC1.app_hexid,SRC1.responsible_org_unit_hexid,SRC1.Owning_Organization,
level2.LVL3_ORG_HEX,level2.LVL3_ORG_NAME,level2.LVL2_ORG_NAME,level2.LVL1_ORG_NAME
from pandg_mdsdb.pg_mega_pgb_application_rita_final SRC
LEFT JOIN 
(select a.app_hexid,a.sourceinstance,a.responsible_org_unit_hexid,
CASE WHEN Count(1) <= 1 then MAX(coalesce(a.responsible_org_unit,'UNSPECIFIED')) else 'UNKNOWN' end as 'Owning_Organization'  
from pandg_mdsdb.pg_mega_pgv_app_responsible_org_person_final a WHERE a.pg_development_org = 'Y' 
group by a.app_hexid 
) SRC1 ON (SRC.NAME=SRC1.app_hexid AND SRC.sourceinstance=SRC1.sourceinstance )
LEFT JOIN pandg_mdsdb.pg_mega_pgv_org_itam_gbs_final level2
ON SRC1.responsible_org_unit_hexid=level2.LVL2_ORG_HEX AND SRC1.sourceinstance=level2.sourceinstance;

=================================================================================================================================

Leve13:

Select SRC.NAME,SRC1.app_hexid,SRC1.responsible_org_unit_hexid,SRC1.Owning_Organization,
level3.LVL3_ORG_HEX,level3.LVL3_ORG_NAME,level3.LVL2_ORG_NAME,level3.LVL1_ORG_NAME
from pandg_mdsdb.pg_mega_pgb_application_rita_final SRC
LEFT JOIN 
(select a.app_hexid,a.sourceinstance,a.responsible_org_unit_hexid,
CASE WHEN Count(1) <= 1 then MAX(coalesce(a.responsible_org_unit,'UNSPECIFIED')) else 'UNKNOWN' end as 'Owning_Organization'  
from pandg_mdsdb.pg_mega_pgv_app_responsible_org_person_final a WHERE a.pg_development_org = 'Y' 
group by a.app_hexid 
) SRC1 ON (SRC.NAME=SRC1.app_hexid AND SRC.sourceinstance=SRC1.sourceinstance )
LEFT JOIN pandg_mdsdb.pg_mega_pgv_org_itam_gbs_final level3
ON SRC1.responsible_org_unit_hexid=level3.LVL3_ORG_HEX AND SRC1.sourceinstance=level3.sourceinstance;

===================================================================================================================================





