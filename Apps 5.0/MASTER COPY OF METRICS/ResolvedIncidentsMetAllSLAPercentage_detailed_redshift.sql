
SELECT  a.ABC/b.XYZ * 100 as ResolvedIncidentsMetAllSLAPercentage
FROM 

(SELECT 
count(a.row_key) as ABC
FROM ldb.f_incident_resolved a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.last_resolved_on_key=c.row_key
where b.met_sla_flag='N'
and c.lagging_count_of_month between 0 and 12)a
CROSS JOIN 
(SELECT 
count(a.row_key) as XYZ
FROM ldb.f_incident_resolved a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.last_resolved_on_key=c.row_key
Where c.lagging_count_of_month between 0 and 12
)b