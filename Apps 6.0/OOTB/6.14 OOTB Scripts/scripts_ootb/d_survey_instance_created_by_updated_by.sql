select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for survey_instance_final to d_survey_instance for created by updated by' else 'SUCCESS' end as Message
from ( SELECT * FROM #MDS_TABLE_SCHEMA.survey_instance_final WHERE CDCTYPE<>'D') S
left outer join #DWH_TABLE_SCHEMA.d_survey_instance DWH
on S.sys_id = DWH.row_id
where (ifnull(S.sys_created_by,'')<>ifnull(DWH.created_by,'')) or (ifnull(S.sys_updated_by,'')<>ifnull(DWH.changed_by,''))
