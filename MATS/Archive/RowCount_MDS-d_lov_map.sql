




SELECT CASE WHEN  (count_mds = count_dwh) THEN 'SUCCESS' ELSE 'FAILURE' END AS Result
,CASE WHEN (count_mds =count_dwh) THEN 'Data Matched'
ELSE CONCAT( 'MDS-DWH RowCount did not Match for ', DWH.Table_DWH , '. MDS:',count_mds,'DWH : ' ,DWH.Count_DWH)
END AS Message
FROM ( SELECT(
(SELECT COUNT(*) FROM #MDS_TABLE_SCHEMA.us_currency_rate_type_map_final )
+
(SELECT COUNT(*) FROM #MDS_TABLE_SCHEMA.us_accounttype_map_final )
+
(SELECT COUNT(*) FROM #MDS_TABLE_SCHEMA.us_units_map_final )
+
(SELECT COUNT(*) FROM #MDS_TABLE_SCHEMA.us_fin_status_lov_map_final )
+
(SELECT COUNT(*) FROM #MDS_TABLE_SCHEMA.us_om_lov_map_final )
+
(SELECT COUNT(*) FROM #MDS_TABLE_SCHEMA.us_finbucket_map_final )
+
(SELECT COUNT(*) FROM #MDS_TABLE_SCHEMA.us_currency_map_final  )
+
(SELECT COUNT(*) FROM #MDS_TABLE_SCHEMA.us_gender_map_final  )
+
(SELECT COUNT(*) FROM #MDS_TABLE_SCHEMA.us_state_map_final  )
+
(SELECT COUNT(*) FROM #MDS_TABLE_SCHEMA.us_city_map_final  )
+
(SELECT COUNT(*) FROM #MDS_TABLE_SCHEMA.us_country_map_final )
+
(SELECT COUNT(*) FROM #MDS_TABLE_SCHEMA.us_incident_map_final )
+
(SELECT COUNT(*) FROM #MDS_TABLE_SCHEMA.us_problem_map_final )
+
(SELECT COUNT(*) FROM #MDS_TABLE_SCHEMA.us_task_map_final )
+
(SELECT COUNT(*) FROM #MDS_TABLE_SCHEMA.us_sc_request_map_final )
+
(SELECT COUNT(*) FROM #MDS_TABLE_SCHEMA.us_task_sla_map_final )
+
(SELECT COUNT(*) FROM #MDS_TABLE_SCHEMA.us_sc_req_item_map_final )
+
(SELECT COUNT(*) FROM #MDS_TABLE_SCHEMA.us_question_map_final  )
) AS count_mds) MDS,
(SELECT COUNT(*) Count_DWH, 'd_lov_map'  Table_DWH 
FROM #TABLE_SCHEMA.d_lov_map WHERE row_key NOT IN (0,-1)) DWH

