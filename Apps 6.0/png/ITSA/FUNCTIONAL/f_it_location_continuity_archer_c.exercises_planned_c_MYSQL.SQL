SELECT
    CASE 
    WHEN CNT > 0 THEN 'FAILURE'
    ELSE 'SUCCESS'
    END AS RESULT
    , CASE
    WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_it_location_continuity_archer_c.exercises_planned_c'
    ELSE 'SUCCESS'
    END AS MESSAGE
FROM
	(
		SELECT
			count(1) AS CNT
		FROM
			png_mdsdb.us_it_location_site_sufficiency_archer_final src
			LEFT JOIN (
				SELECT
					dtrgt.first_published_datetime_c
					, dtrgt.tracking_id_c
					, dtrgt.row_id as d_row_id
					, ftrgt.*
				FROM 
					png_mdwdb.d_it_location_continuity_archer_c dtrgt
					JOIN png_mdwdb.f_it_location_continuity_archer_c ftrgt ON dtrgt.row_key = ftrgt.it_location_continuity_archer_c_key
			) mdw ON CONCAT(src.First_Published_01348217794,'~', src.Tracking_ID_0748258556) = mdw.d_row_id
		WHERE 
			src.SC_3_5_Exercises_planned_0144979446 <> mdw.exercises_planned_c 
            AND src.cdctype<>'D'
) temp
;


