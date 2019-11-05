

SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message from (
select count(1) cnt
        FROM
rogers6_mdwdb.f_task_survey f
join rogers6_mdwdb.d_incident di on f.incident_key=di.row_key and f.source_id=di.source_id
JOIN rogers6_mdsdb.us_dissats_comments_c_final dc ON di.incident_number=dc.ticket AND di.source_id=dc.sourceinstance
where f.dissatisfier_category_c <> coalesce(dc.dissatisfier_category,'UNSPECIFIED')
and dc.CDCTYPE='X')a