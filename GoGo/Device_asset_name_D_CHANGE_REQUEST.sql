gogo_mdsdb.change_request_final a
inner join gogo_mdwdb.d_change_request  b on a.sys_id collate utf8_unicode_ci=b.row_id  #and b.row_key <100
where a.u_device_asset_name <> b.device_asset_name_c
