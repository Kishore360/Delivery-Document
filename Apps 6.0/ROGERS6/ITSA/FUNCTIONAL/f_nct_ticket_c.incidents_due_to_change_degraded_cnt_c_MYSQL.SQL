
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_nct_ticket_c.incidents_due_to_change_degraded_cnt_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM rogers6_mdwdb.f_nct_ticket_c TRGT
JOIN 
(
SELECT 
none_cnt, degrade_cnt, outage_cnt, impacting_cnt, Servict_type, inc_due_chg_cnt, threatened_cnt, imt_cnt, nct_key
FROM 
(
Select 
SUM(CASE WHEN LKP.dimension_name='None' THEN 1 ELSE 0 END) AS none_cnt,
SUM(CASE WHEN LKP.dimension_name='Degraded' THEN 1 ELSE 0 END) AS degrade_cnt,
SUM(CASE WHEN LKP.dimension_name='Outage' THEN 1 ELSE 0 END) AS outage_cnt,
SUM(CASE WHEN LKP.dimension_name<>'None' THEN 1 ELSE 0 END) AS impacting_cnt,
GROUP_CONCAT(DISTINCT LKP.dimension_name ORDER BY LKP.dimension_name ASC SEPARATOR ' , ') AS Servict_type,
COUNT(distinct c.row_key) AS inc_due_chg_cnt,
SUM(CASE WHEN LKP.dimension_name='Threatened' THEN 1 ELSE 0 END) AS threatened_cnt,
COUNT(c.row_key) AS imt_cnt,
a.row_key AS nct_key 
FROM rogers6_mdwdb.d_nct_ticket_c a
JOIN rogers6_mdwdb.d_com_associated_ticket_c b ON a.row_key=b.nct_ticket_c_key AND b.com_associated_ticket_category_c='IMT - Cause'
JOIN rogers6_mdwdb.d_imt_main_c c ON b.associated_imt_main_c_key=c.row_key AND ceil(b.status_c)=0
JOIN rogers6_mdwdb.d_lov LKP ON c.imt_main_service_impact_c_key=LKP.row_key
WHERE a.soft_deleted_flag='N' AND b.soft_deleted_flag='N' and c.soft_deleted_flag='N'
AND c.row_key > 0 
group by a.row_key 
) X
)  Y ON TRGT.nct_ticket_c_key=Y.nct_key
Where Y.degrade_cnt<> TRGT.incidents_due_to_change_degraded_cnt_c 
) temp;


  