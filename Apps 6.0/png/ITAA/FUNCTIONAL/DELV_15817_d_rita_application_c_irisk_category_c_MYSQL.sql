SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.irisk_category_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM 
(
select ra.name,ra.SHORT_NAME,ra.sourceinstance,
CASE WHEN sum(case when irwi.mega_hex_id is not null then 1 else 0 END) > 0 THEN  'Y' ELSE 'N' END as exists_in_iRisk_flag 
,CASE WHEN sum(case when Status_VS_Baseline = 'Complete' THEN 1 ELSE 0 END) > 0 THEN  'Y' ELSE 'N' END as exists_in_legacy1
, 
CASE WHEN sum(case when irl234.CIS_Rough_cut_assessment_done_YesNo = 'Yes' THEN 1 ELSE 0 END) > 0 THEN  'Y' ELSE 'N' END as exists_in_legacy234 ,
CASE WHEN SUM(CASE WHEN ra.name = irwi.MEGA_HEX_ID THEN 1 ELSE 0 END)  > 0 THEN  
CASE  WHEN 
SUM(case when irwi.mega_hex_id is not null THEN 1 ELSE 0 END) = 
SUM(case when irwi.Assessment_Status in ('Complete','canceled','cancelled') THEN 1 ELSE 0 END) THEN 'Complete'
ELSE 'Incomplete' END
ELSE 'N/A' END
 as irisk_status ,
 
 SUM( case when irwi.Assessment_Status IN ('Complete','Cancelled') and irwi.Issues_ID is not null and irwi.Issues_ID is not null
	 and irwi.Overall_Status not in ('Complete','Draft','Closed') then 1
	end) as iRisk_Open_Issues
 

from png_mdsdb.pg_mega_pgb_application_rita_final as ra
left join png_mdsdb.pg_mega_irisk_assessment_issues_final as irwi on ra.name = irwi.MEGA_HEX_ID and ra.sourceinstance = irwi.sourceinstance and irwi.cdctype ='X'
left join png_mdsdb.pg_mega_legacyg1_final as irl1 on ra.name = irl1.MEGA_ID and ra.sourceinstance = irl1.sourceinstance and irl1.cdctype ='X'
left join png_mdsdb.pg_mega_legacyg234_final as irl234 on ra.name = irl234.MEGA_ID  and ra.sourceinstance = irl234.sourceinstance and irl234.cdctype ='X'
where ra.cdctype = 'X'
group by 1,2,3

) SRC 
LEFT JOIN png_mdwdb.d_rita_application_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE 
(CASE 
WHEN SRC.exists_in_iRisk_flag ='Y' AND  (SRC.iRisk_Status='Complete') AND (SRC.iRisk_Open_Issues IS NULL OR SRC.iRisk_Open_Issues=0) THEN '4'
WHEN SRC.exists_in_iRisk_flag ='Y' AND (SRC.iRisk_Status='Complete')  AND (SRC.iRisk_Open_Issues IS NOT NULL)   THEN '5'
WHEN SRC.exists_in_iRisk_flag ='Y' AND (SRC.iRisk_Status<>'Complete') THEN '6'
WHEN SRC.exists_in_iRisk_flag <>'Y' AND (SRC.exists_in_legacy1='Y') THEN '2'
WHEN SRC.exists_in_iRisk_flag <>'Y'AND (SRC.exists_in_legacy234='Y') THEN '3'
ELSE '7'
END)<>TRGT.irisk_category_c
) temp;