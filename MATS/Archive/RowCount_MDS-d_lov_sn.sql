




SELECT CASE WHEN  (count_mds = count_dwh) THEN 'SUCCESS' ELSE 'FAILURE' END AS Result
,CASE WHEN (count_mds =count_dwh) THEN 'Data Matched'
ELSE CONCAT( 'MDS-DWH RowCount did not Match for ', DWH.Table_DWH , '. MDS:',count_mds,'DWH : ' ,DWH.Count_DWH)
END AS Message
FROM (SELECT ( (SELECT  COUNT(DISTINCT
CONCAT(iso_3166_2_state_char_2_code,'~',city_name__gazetteer,'~','CITY_WH')) AS ROW_ID
FROM #MDS_TABLE_SCHEMA.us_city_iso_codes_final) +
(SELECT COUNT(*) FROM #MDS_TABLE_SCHEMA.us_gender_iso_codes_final) +
  (SELECT COUNT(*) FROM #MDS_TABLE_SCHEMA.us_incident_age_bucket_lov_final) +
  (SELECT COUNT(*) FROM #MDS_TABLE_SCHEMA.us_incident_final) +
  (SELECT COUNT(*) FROM #MDS_TABLE_SCHEMA.us_problem_final) +
  (SELECT COUNT(*) FROM #MDS_TABLE_SCHEMA.us_sc_request_final) +
  (SELECT COUNT(*) FROM #MDS_TABLE_SCHEMA.us_request_age_bucket_final) +
  (SELECT COUNT(*) FROM #MDS_TABLE_SCHEMA.us_task_final) +
  (SELECT COUNT(*) FROM #MDS_TABLE_SCHEMA.us_task_sla_final) +
  (SELECT COUNT(*) FROM #MDS_TABLE_SCHEMA.us_sc_req_item_final) +
  (SELECT COUNT(*) FROM #MDS_TABLE_SCHEMA.us_question_final) +
   (SELECT COUNT(*) FROM #MDS_TABLE_SCHEMA.us_accounttype_final ) +
   (SELECT COUNT(*) FROM #MDS_TABLE_SCHEMA.us_fin_status_lov_wh_final) +
   (SELECT COUNT(*) FROM #MDS_TABLE_SCHEMA.us_units_final) +
   (SELECT COUNT(*) FROM #MDS_TABLE_SCHEMA.us_currency_rate_type_wh_final) +
   (SELECT COUNT(*) FROM #MDS_TABLE_SCHEMA.us_om_wh_codes_final) +
 
   (SELECT COUNT(*) FROM #MDS_TABLE_SCHEMA.us_wh_finbucket_final) + 
   (SELECT COUNT(DISTINCT 
   CONCAT(IFNULL(iso_3166_2_sub_division_state_code,''),'~', IFNULL(iso_3166_2_subdivision_state_name,''),'~','STATE_WH')) AS ROW_ID
   FROM #MDS_TABLE_SCHEMA.us_state_iso_codes_final ) +
   
   (SELECT COUNT(DISTINCT CONCAT(ccy,'~',ccynm,'~','CURRENCY_WH')) AS ROW_ID
   FROM #MDS_TABLE_SCHEMA.us_currency_iso_codes_final ) +

   (SELECT COUNT(*) FROM #MDS_TABLE_SCHEMA.us_country_iso_codes_final) +
   
   (SELECT 9 AS tenant_Information FROM DUAL) +
 (SELECT COUNT(*) FROM (SELECT  sys_id                      
FROM #MDS_TABLE_SCHEMA.sys_choice_delta                         
 WHERE
(sys_choice_delta.element='gender' AND sys_choice_delta.NAME ='sys_user')
AND sys_choice_delta.language='en'
UNION
SELECT cmn_location_delta.country AS ROW_ID  FROM #MDS_TABLE_SCHEMA.cmn_location_delta WHERE cmn_location_delta.country IS NOT NULL GROUP BY cmn_location_delta.country
UNION
SELECT  CONCAT(IFNULL(cmn_location_delta.country,''),'~',IFNULL(cmn_location_delta.state,''),'~',IFNULL(cmn_location_delta.city,'')) AS ROW_ID FROM #MDS_TABLE_SCHEMA.cmn_location_delta WHERE cmn_location_delta.city IS NOT NULL GROUP BY city,state,country
UNION
SELECT  CONCAT(IFNULL(cmn_location_delta.country,''),'~',IFNULL(cmn_location_delta.state,'')) AS ROW_ID FROM #MDS_TABLE_SCHEMA.cmn_location_delta WHERE cmn_location_delta.state IS NOT NULL GROUP BY state,country
)A ) +

(SELECT COUNT(*)  FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_choice_delta d WHERE NAME ='incident' AND 
 d.language='en' AND element IN ('category','subcategory','state','severity','close_code') GROUP BY element,VALUE )sd)  +

(SELECT COUNT(*) FROM (SELECT * FROM
    #MDS_TABLE_SCHEMA.sys_choice_delta d WHERE NAME ='task' AND d.language='en' AND element
     IN ('contact_type','impact','urgency','priority','state','approval') GROUP BY element,VALUE )task) +
(SELECT COUNT(*) FROM (SELECT * FROM #MDS_TABLE_SCHEMA.sys_choice_delta d WHERE NAME ='problem' AND
 d.language='en' AND 
 element IN ('problem_state') GROUP BY element,VALUE) problem)  +

 (SELECT COUNT(*) FROM (SELECT * FROM #MDS_TABLE_SCHEMA.sys_choice_delta d WHERE NAME ='sc_request' 
    AND d.language='en' AND element IN ('stage','request_state') GROUP BY element,VALUE)sc_request) +

(SELECT COUNT(*) FROM(SELECT  * FROM #MDS_TABLE_SCHEMA.sys_choice_delta d WHERE NAME ='task_sla' AND d.language='en' AND element IN ('stage') 
 GROUP BY element,VALUE ) task_sla)  +
(SELECT COUNT(*) FROM (SELECT * FROM #MDS_TABLE_SCHEMA.sys_choice_delta d 
    WHERE NAME ='sc_req_item' AND d.language='en' AND element IN ('stage','state')
  GROUP BY element,VALUE) sc_req_item) +
 (SELECT COUNT(*) FROM(SELECT * FROM #MDS_TABLE_SCHEMA.sys_choice_delta d WHERE NAME ='question' AND d.language='en' AND element 
  IN ('type') GROUP BY element,VALUE) question)+

(SELECT COUNT(*) FROM(SELECT *  FROM #MDS_TABLE_SCHEMA.sys_choice_delta d WHERE NAME ='facilities' AND d.language='en' 
 AND element IN ('category') GROUP BY element,VALUE)category) +
(SELECT COUNT(*) FROM( SELECT *  FROM #MDS_TABLE_SCHEMA.sys_choice_delta d WHERE NAME ='change_request' AND 
      d.language='en' AND element IN ('category','risk','type','reason','scope','review_status') 
 GROUP BY element,VALUE )change_request)+
 (SELECT COUNT(*) FROM #MDS_TABLE_SCHEMA.us_itsm_kpi_final) +
(SELECT COUNT(*) FROM #MDS_TABLE_SCHEMA.us_financial_kpi_final) +
(SELECT COUNT(*) FROM #MDS_TABLE_SCHEMA.fx_currency_final) ) AS count_mds) MDS,
(SELECT COUNT(*) Count_DWH, 'd_lov'  Table_DWH 
FROM #TABLE_SCHEMA.d_lov WHERE row_key NOT IN (0,-1)) DWH

