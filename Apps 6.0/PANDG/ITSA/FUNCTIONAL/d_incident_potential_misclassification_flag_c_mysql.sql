
SELECT 
CASE WHEN count(1) > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1) > 0 THEN 'MDS to DWH data validation failed for d_incident.potential_misclassification_flag_c' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT COUNT(1) as CNT 
FROM 
(
SELECT trgt.row_id,
lv.dimension_code = 1 ,lv_mp.dimension_class = 'STATE~INCIDENT' , lv_mp.dimension_wh_code in('CLOSED','RESOLVED') ,
X.age ,trgt.associated_incident_alert_flag_c , X.impact_src_code =3 , trgt.p1_priority_flag_c = 'Y' ,d_conf.used_for_flag_c = 'Y' ,cbp.cnt,trgt.potential_misclassification_flag_c
FROM
png_mdwdb.d_incident trgt
JOIN
(SELECT f_inc.incident_key,MAX(f_inc.configuration_item_key) as configuration_item_key,MAX(f_inc.age) age,MAX(f_chg.impact_src_code) impact_src_code,count(1) as cnt
FROM png_mdwdb.f_incident f_inc
JOIN png_mdwdb.f_change_request f_chg ON f_inc.change_request_key = f_chg.change_request_key OR f_chg.incident_key = f_inc.incident_key
GROUP BY 1
) X
ON trgt.row_key = X.incident_key
JOIN png_mdwdb.d_lov lv ON trgt.priority_src_key = lv.row_key
JOIN png_mdwdb.d_lov_map lv_mp ON trgt.state_src_key =lv_mp.src_key
JOIN png_mdwdb.d_configuration_item d_conf ON X.configuration_item_key = d_conf.row_key
LEFT JOIN (SELECT incident_cbp_c_key,count(1) cnt FROM png_mdwdb.f_task_cbp_c WHERE impacted_cbp_flag ='Y' AND incident_cbp_c_key >0 and soft_deleted_flag ='N' group by 1) cbp ON trgt.row_key =cbp.incident_cbp_c_key

WHERE trgt.potential_misclassification_flag_c <>
CASE WHEN lv.dimension_code = 1 AND lv_mp.dimension_class = 'STATE~INCIDENT' AND lv_mp.dimension_wh_code in('CLOSED','RESOLVED') 
AND((X.age >86400 AND trgt.associated_incident_alert_flag_c = 'N') 
OR (X.impact_src_code =3) OR (trgt.p1_priority_flag_c = 'Y') OR (d_conf.used_for_flag_c = 'Y') OR COALESCE(cbp.cnt,0)<=0) THEN 'Y' ELSE 'N' END
) Y 
) temp;
