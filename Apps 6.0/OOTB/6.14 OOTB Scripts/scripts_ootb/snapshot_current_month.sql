-- current and prev
drop table  if exists app_test.curr_snap_month;
CREATE TABLE app_test.curr_snap_month AS (SELECT fin.calendar_code,
    fin.n_date,
    fin.created_by,
    fin.assigned_to_key,
    COALESCE(dage.row_key, - 1) AS age_key,
    fin.changed_by,
    fin.reopened_flag,
    fin.opened_by_department_key,
    fin.row_id,
    COALESCE(d_dage.row_key, - 1) AS dormancy_age_key,
    fin.opened_by_key,
    fin.category_src_key,
    fin.assignment_group_key,
    fin.business_service_key,
    fin.incident_key,
    'A' AS CDCtype,
    fin.configuration_key AS configuration_item_key,
    fin.priority_src_key,
    fin.dormancy_age,
    fin.state_src_key,
    fin.source_id,
    fin.n_key,
    'N' AS soft_deleted_flag,
    fin.age,
	fin.changed_on,
    fin.created_on
	FROM
    (SELECT 
        f.incident_key,
            f.row_id,
            f.opened_by_department_key,
            f.opened_by_key,
            f.source_id,
            der.current_month_n_key AS n_key,
            DATE_FORMAT(der.current_month_n_key, '%Y-%m-%d 00:00:00') AS n_date,
            f.changed_on,
            DATE_FORMAT(f.opened_on_key, '%Y-%m-%d') AS opened_on,
            f.created_on,
            f.created_by,
            f.changed_by,
            f.dormancy_Age AS dormancy_Age,
            f.age AS age,
            f.state_src_key,
            f.priority_src_key,
            f.category_src_key,
            f.assignment_group_key,
            f.assigned_to_key,
            f.configuration_item_key AS configuration_key,
            f.business_service_key,
            d.reopened_flag,
            v.calendar_code
    FROM
        #DWH_TABLE_SCHEMA.f_incident_backlog_snapshot_view v
    INNER JOIN #DWH_TABLE_SCHEMA.f_incident f ON v.row_id = f.row_id
    INNER JOIN #DWH_TABLE_SCHEMA.d_incident d ON f.incident_key = d.row_key
    INNER JOIN (SELECT DISTINCT
        df.source_id,
            df.lastupdated,
            dcal.row_key,
            dcal.row_id,
            DATE_FORMAT(dcal.month_start_date, '%Y%m%d') AS current_month,
            DATE_FORMAT(dcal.month_start_date, '%Y%m%d') AS current_month_n_key
    FROM
        (SELECT 
        source_id, MAX(lastupdated) AS lastupdated
		FROM     #DWH_TABLE_SCHEMA.d_o_data_freshness
		GROUP BY source_id) df
		INNER JOIN #DWH_TABLE_SCHEMA.d_calendar_date dcal 
		ON DATE_FORMAT(df.lastupdated, '%Y%m%d') = dcal.row_key
		) der 
	ON v.source_id = der.source_id
    
    ) fin
	LEFT JOIN  #DWH_TABLE_SCHEMA.d_lov dage 
	ON fin.age BETWEEN dage.lower_range_value AND dage.upper_range_value
	AND dage.dimension_class = 'WH_AGEBUCKET~INCIDENT'
	LEFT JOIN  #DWH_TABLE_SCHEMA.d_lov d_dage 
    ON fin.dormancy_age BETWEEN d_dage.lower_range_value AND d_dage.upper_range_value
	AND d_dage.dimension_class = 'WH_DORMANCYBUCKET~INCIDENT')
;
