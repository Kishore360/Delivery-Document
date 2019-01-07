

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.grace_period_start_date' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT COUNT(1) as CNT 
FROM png_mdsdb.pg_mega_pgb_application_rita_final SRC 
LEFT JOIN png_mdwdb.d_rita_application_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN (select source_id,max(lastupdated) as lastupdated from png_mdwdb.o_data_freshness
group by source_id) OD ON TRGT.source_id=OD.source_id
LEFT JOIN 
(SELECT a.app_hexid,a.sourceinstance,
CASE WHEN Count(distinct a.responsible_org_unit_hexid) <= 1 THEN MAX(COALESCE(a.responsible_org_unit_hexid,'UNSPECIFIED')) ELSE 'UNKNOWN' end as responsible_org_unit_hexid  
FROM png_mdsdb.pg_mega_pgv_app_responsible_org_person_final a WHERE a.pg_development_org = 'Y' AND a.app_hexid IS NOT NULL
group by a.app_hexid,a.sourceinstance) SRC1 ON (SRC.NAME=SRC1.app_hexid AND SRC.sourceinstance=SRC1.sourceinstance )
LEFT JOIN png_mdsdb.pg_mega_pgv_org_itam_gbs_final level1
ON (SRC1.responsible_org_unit_hexid=level1.LVL1_ORG_HEX AND SRC1.sourceinstance=level1.sourceinstance )
WHERE 
CASE WHEN 
SRC.APPLICATION_NATURE IN ('Generic','XOApplication','NonDigital','Component')
AND SRC.LIFE_CYCLE_STATUS  NOT IN ('Decomissioned','Exception Use','not_used','Undecided','Discovery/Requ.','Exception')
AND TRGT.gdpr_relevant_c_flag ='Y' 
AND level1.LVL1_ORG_NAME IN 
('Information Security','IT Consumer Solutions','IT Customer Solutions & Delivery','IT Data & Analytics Organization','IT IT Development Organization',
'IT IT Innovation Organization','IT Solutions','Consumer Services','FSS','IDQ','MANAGEMENT SERVICES','Master Data Organization','MY PG SERVICES',
'PS Shared Services & Technology Operations','PTW'
)
THEN COALESCE(TRGT.grace_period_start_date,CONVERT_TZ(OD.lastupdated,'GMT','America/New_York')) 
ELSE NULL END <> TRGT.grace_period_start_date
) temp;



 


