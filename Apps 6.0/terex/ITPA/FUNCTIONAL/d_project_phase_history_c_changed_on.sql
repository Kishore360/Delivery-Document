select CASE WHEN count(1) THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN count(1) THEN 'MDS to DWH data validation failed for d_project_phase_history_c.changed_on' ELSE 'SUCCESS' END as Message
from terex_mdsdb.pv_projects_final SRC JOIN
terex_b1_mdwdb.d_project_phase_history_c TGT ON SRC.ID = TGT.row_id
where TGT.changed_on <> CONVERT_TZ (SRC.Last_Modified_Date,
                'UTC',
                'America/New_York');