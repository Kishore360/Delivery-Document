INSERT INTO dwh_o_data_freshness(etl_run_number,source_id,sourcename,lastupdated,subject_area)
SELECT 1 FROM (SELECT 1,2,'NS',now(),'FIN') AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM dwh_o_data_freshness WHERE subject_area = 'FIN'
) LIMIT 1;
