
INSERT INTO lsm_ls_source_timezone(sourceid,source_time_zone,target_time_zone)
SELECT * FROM (SELECT 2,'GMT','America/Los_Angeles') AS tmp
WHERE NOT EXISTS (
    SELECT * FROM lsm_ls_source_timezone WHERE sourceid = 2
) LIMIT 1;