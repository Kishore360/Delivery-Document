create table wow_workdb.one2manyalarmpreset(row_id varchar(1000),alarmpreset_id varchar (1000),index abc(row_id,source_id),index efg (alarmpreset_id))
SELECT CONCAT(inc.sys_id,'~',COALESCE(SUBSTRING_INDEX(SUBSTRING_INDEX(TRIM(inc.u_alarm_preset), ',', n.n), ',', -1),'UNSPECIFIED')) AS row_id,
       inc.sourceinstance AS source_id,
       COALESCE(SUBSTRING_INDEX(SUBSTRING_INDEX(TRIM(inc.u_alarm_preset), ',', n.n), ',', -1),'UNSPECIFIED') AS alarmpreset_id
FROM wow_mdsdb.u_incident_outage_final inc
CROSS JOIN
  (SELECT a.N + b.N * 10 + 1 AS n
   FROM
     (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
      (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b
   ORDER BY n) n
ON n.n <= 1 + (LENGTH(COALESCE(TRIM(inc.u_alarm_preset),'UNSPECIFIED')) - LENGTH(REPLACE(COALESCE(TRIM(inc.u_alarm_preset),'UNSPECIFIED'), ',', '')))
;

SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
, CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select
Count(1) as cnt
from  wow_mdwdb.f_incident_outage_alarm_preset_c a11
join wow_workdb.one2manyalarmpreset a12
on a11.row_id=a12.row_id and a11.source_id=a12.source_id
join wow_mdwdb.d_alarm_c a13
on a12.alarmpreset_id=a13.row_id
where a13.row_key <> a11.alarm_c_key)a;