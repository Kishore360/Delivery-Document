select row_key,soft_deleted_flag,etl_run_number,row_id from #DWH_TABLE_SCHEMA.f_n_asset_status_history_quarterly order by row_key;