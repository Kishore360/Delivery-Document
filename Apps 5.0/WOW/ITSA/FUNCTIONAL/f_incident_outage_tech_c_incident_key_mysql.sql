<<<<<<< HEAD
create table wow_workdb.one2manytech(row_id varchar(1000),tech_id varchar (1000),index abc(row_id,source_id),index efg (tech_id))
SELECT CONCAT(inc.sys_id,'~',COALESCE(SUBSTRING_INDEX(SUBSTRING_INDEX(TRIM(inc.u_tech), ',', n.n), ',', -1),'UNSPECIFIED')) AS row_id,
       inc.sourceinstance AS source_id,
       COALESCE(SUBSTRING_INDEX(SUBSTRING_INDEX(TRIM(inc.u_tech), ',', n.n), ',', -1),'UNSPECIFIED') AS tech_id
FROM wow_mdsdb.u_incident_outage_final inc
CROSS JOIN
  (SELECT a.N + b.N * 10 + 1 AS n
   FROM
     (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
      (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b
   ORDER BY n) n
ON n.n <= 1 + (LENGTH(COALESCE(TRIM(inc.u_tech),'UNSPECIFIED')) - LENGTH(REPLACE(COALESCE(TRIM(inc.u_tech),'UNSPECIFIED'), ',', '')))

;
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
, CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select
Count(1) as cnt
from  wow_mdwdb.f_incident_outage_tech_c a11
join wow_workdb.one2manytech a12
on (CONCAT(a12.sys_id,'~',COALESCE(SUBSTRING_INDEX(SUBSTRING_INDEX(TRIM(a12.u_tech), ',', n.n), ',', -1),'UNSPECIFIED')) =a11.row_id  
 AND a12.sourceinstance= a11.source_id  )
join wow_mdwdb.d_incident LKP 
=======

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM wow_mdsdb.u_incident_outage_final SRC 
 CROSS JOIN
(SELECT a.N + b.N * 10 + 1 AS n
FROM
 (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
 (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b
ORDER BY n) n
ON n.n <= 1 + (LENGTH(COALESCE(TRIM(SRC.u_tech),'UNSPECIFIED')) - LENGTH(REPLACE(COALESCE(TRIM(SRC.u_tech),'UNSPECIFIED'), ',', '')))
 LEFT JOIN wow_mdwdb.f_incident_outage_tech_c TRGT 
 ON (CONCAT(SRC.sys_id,'~',COALESCE(SUBSTRING_INDEX(SUBSTRING_INDEX(TRIM(SRC.u_tech), ',', n.n), ',', -1),'UNSPECIFIED')) =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN wow_mdwdb.d_incident LKP 
>>>>>>> 20f0e06072938edda6b1b9688b84e9fb1b168466
 ON ( SRC.sys_id= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )

 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.sys_id IS NULL THEN 0 else -1 end)<> (TRGT.incident_key))a

;

