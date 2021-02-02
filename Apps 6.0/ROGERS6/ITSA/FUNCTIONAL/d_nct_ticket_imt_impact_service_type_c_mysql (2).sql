SELECT 
CASE WHEN CNT  > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM
 (
 SELECT Count(1) as CNT 
FROM rogers6_mdwdb.d_nct_ticket_c X 
JOIN 
(
Select  
SUM(CASE WHEN LKP.dimension_name='None' THEN 1 ELSE 0 END) AS none_cnt,
SUM(CASE WHEN LKP.dimension_name='Degraded' THEN 1 ELSE 0 END) AS degrade_cnt,
SUM(CASE WHEN LKP.dimension_name='Outage' THEN 1 ELSE 0  END) AS outage_cnt,
SUM(CASE WHEN LKP.dimension_name<>'None' THEN 1 ELSE 0 END) AS impacting_cnt,
GROUP_CONCAT(DISTINCT LKP.dimension_name ORDER BY LKP.dimension_name ASC SEPARATOR ' , ') AS Servict_type,
COUNT(SRC3.row_key) AS inc_due_chg_cnt,
SUM(CASE WHEN LKP.dimension_name='Threatened' THEN 1 ELSE 0 END) AS threatened_cnt,
COUNT(SRC3.row_key) AS imt_cnt,
SRC.row_key AS nct_key
FROM rogers6_mdwdb.d_nct_ticket_c SRC
JOIN rogers6_mdwdb.d_com_associated_ticket_c SRC1 ON SRC.row_key=SRC1.nct_ticket_c_key AND SRC1.com_associated_ticket_category_c ='IMT - Cause'
JOIN rogers6_mdwdb.d_imt_main_c SRC3 ON SRC1.associated_imt_main_c_key=SRC3.row_key AND CEIL(SRC1.status_c)=0
JOIN rogers6_mdwdb.d_lov LKP ON SRC3.network_impact_c_key=LKP.row_key 
Where SRC.soft_deleted_flag ='N' AND SRC1.soft_deleted_flag ='N' AND SRC3.soft_deleted_flag ='N' AND SRC3.row_key > 0
group by SRC.row_key
) Y On X.row_key=Y.nct_key
WHERE 
(
CASE 
WHEN Y.Servict_type = 'None' THEN 'None Only'  
WHEN Y.Servict_type = 'Outage' THEN 'Outage Only' 
WHEN Y.Servict_type = 'Degraded' THEN 'Degraded Only' 
WHEN Y.Servict_type = 'Threatened' THEN 'UNSPECIFIED'  ELSE replace (Y.Servict_type,'Threatened','UNSPECIFIED') END 
)<> X.imt_impact_service_type_c
 ) temp;
 
