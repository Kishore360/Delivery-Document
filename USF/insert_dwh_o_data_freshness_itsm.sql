INSERT INTO dwh_o_data_freshness(etl_run_number,source_id,sourcename,lastupdated,subject_area)
SELECT * FROM (SELECT 1,2,'SN',now(),'ITSM') AS tmp
WHERE NOT EXISTS (
    SELECT * FROM dwh_o_data_freshness WHERE subject_area = 'ITSM'
) LIMIT 1;