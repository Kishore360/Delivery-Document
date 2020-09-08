SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END
as Message from(
select count(1) as cnt from
ntrs_mdwdb.d_incident d   
INNER JOIN  ntrs_mdwdb.f_incident f 
ON 			f.row_id  	= d.row_id
AND 		f.source_id	= d.source_id
where 		red_significant_incidents_count_c		<> CASE WHEN red_significant_incident_flag_c = 'Y' then 1 ELSE 0 END )a;
