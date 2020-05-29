select distinct `dwh_table`,
    `calendar_code`,
    `type`,
    `snapshot_table`,
    `snapshot_flag`
from #STAGE_TABLE_SCHEMA.lsm_ls_dw_snapshot_audit 
where `snapshot_flag` ='Y'
order by `dwh_table`,
    `calendar_code`,
    `type`,
    `snapshot_table`,
    `snapshot_flag`;
