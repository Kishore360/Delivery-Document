SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_project.PLANNED_START_DATE ' ELSE 'SUCCESS' END as Message
from (select * from  fidelity_mdsdb.hp_pm_projects_final) SRC
inner join (select * from  fidelity_mdsdb.hp_ppm_fiscal_periods_nls_final)SRC1
on SRC.START_DATE_PERIOD= SRC1.PERIOD_ID
left join  fidelity_mdwdb.d_project TRGT
on SRC.project_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where COALESCE(convert_tz(SRC.START_DATE,'GMT','America/New_York'),'')<>coalesce(TRGT.PLANNED_START_DATE ,'')