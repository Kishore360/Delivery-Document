SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_survey_instance.taken_by_c_key' ELSE 'SUCCESS' END as Message
FROM  rogers6_mdwdb.d_survey_instance a
JOIN rogers6_mdsdb.survey_instance_final b ON a.row_id=b.sys_id
AND a.source_id=b.sourceinstance
left join rogers6_mdwdb.d_survey_wizard_c  c on COALESCE(b.survey_wizard,'UNSPECIFIED')=c.row_id  
where a.soft_deleted_flag='N' and  a.survey_wizard_c_key <>COALESCE(c.row_key,case when survey_wizard is null then 0 else -1 end ) and b.cdctype='X' and c.soft_deleted_flag='N'

