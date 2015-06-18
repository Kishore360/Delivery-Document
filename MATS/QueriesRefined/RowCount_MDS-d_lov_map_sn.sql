




SELECT CASE WHEN  (count_mds = count_dwh) THEN 'SUCCESS' ELSE 'FAILURE' END AS Result
,CASE WHEN (count_mds =count_dwh) THEN 'Data Matched'
ELSE CONCAT( 'MDS-DWH RowCount did not Match for ', DWH.Table_DWH , '. MDS:',count_mds,'DWH : ' ,DWH.Count_DWH)
END AS Message
FROM ( SELECT(
(SELECT COUNT(1) FROM <<tenant>>_mdsdb.us_currency_map_final  )
+
(SELECT COUNT(1) FROM <<tenant>>_mdsdb.us_gender_map_final  )
+
(SELECT COUNT(1) FROM <<tenant>>_mdsdb.us_state_map_final  )
+
(SELECT COUNT(1) FROM <<tenant>>_mdsdb.us_city_map_final  )
+
(SELECT COUNT(1) FROM <<tenant>>_mdsdb.us_country_map_final )
+
(SELECT COUNT(1) FROM <<tenant>>_mdsdb.us_incident_map_final )
+
(SELECT COUNT(1) FROM <<tenant>>_mdsdb.us_problem_map_final )
+
(SELECT COUNT(1) FROM <<tenant>>_mdsdb.us_task_map_final )
+
(SELECT COUNT(1) FROM <<tenant>>_mdsdb.us_sc_request_map_final )
+
(SELECT COUNT(1) FROM <<tenant>>_mdsdb.us_task_sla_map_final )
+
(SELECT COUNT(1) FROM <<tenant>>_mdsdb.us_sc_req_item_map_final )
+
(SELECT COUNT(1) FROM <<tenant>>_mdsdb.us_question_map_final  )
) AS count_mds) MDS,
(SELECT COUNT(1) Count_DWH, 'd_lov_map'  Table_DWH 
FROM <<tenant>>_mdwdb.d_lov_map WHERE row_key NOT IN (0,-1)) DWH

