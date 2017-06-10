
 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(
select count(*) as cnt from 
gilead_mdwdb.d_incident TGT
JOIN
( 
SELECT  SRC.sys_id,LL2.u_display_name
FROM gilead_mdsdb.incident_final SRC  JOIN gilead_mdsdb.u_sparc_category_choices_final LKP2 ON SRC.u_category_level_1 = LKP2.sys_id AND SRC.sourceinstance= LKP2.sourceinstance LEFT JOIN gilead_mdsdb.u_sparc_category_metadata_final LL2 ON LL2.u_level_2 = LKP2.sys_id 
) SS ON TGT.row_id = SS.sys_id 
where TGT.display_name_c<>SS.u_display_name) c;
