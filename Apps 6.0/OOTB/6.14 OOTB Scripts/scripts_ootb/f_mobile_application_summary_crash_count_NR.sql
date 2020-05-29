SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_mobile_application_summary.crash_count' ELSE 'SUCCESS' END as Message
FROM #MDS_TABLE_SCHEMA.Mobile_final mobile LEFT OUTER JOIN #MDS_TABLE_SCHEMA.MobileRequestError_final merr
 ON CONCAT( COALESCE(DATE_FORMAT(FROM_UNIXTIME(mobile.timestamp/1000-MOD(mobile.timestamp/1000, 600)), '%Y%m%d%H%i'),
 'UNSPECIFIED'), '~', COALESCE(FLOOR(mobile.appid), 'UNSPECIFIED'), '~', 
 COALESCE(CONCAT (mobile.city, ', ', mobile.regioncode, ', ', mobile.countryCode), 'UNSPECIFIED'), '~', 
 COALESCE(CONCAT(mobile.device, '~', mobile.devicemodel, '~', mobile.osversion, '~', mobile.devicetype), 'UNSPECIFIED'), '~', 
 COALESCE(mobile.deviceuuid, 'UNSPECIFIED'), '~', COALESCE(mobile.sessionId, 'UNSPECIFIED')  )
 = CONCAT( COALESCE(DATE_FORMAT(FROM_UNIXTIME(merr.timestamp/1000-MOD(merr.timestamp/1000, 600)), '%Y%m%d%H%i'),
 'UNSPECIFIED'), '~', COALESCE(FLOOR(merr.appid), 'UNSPECIFIED'), '~', COALESCE(CONCAT (merr.city, ', ',
merr.regioncode, ', ',merr.countryCode), 'UNSPECIFIED'), '~', 
 COALESCE(CONCAT(merr.device, '~',merr.devicemodel, '~',merr.osversion, '~',
merr.devicetype), 'UNSPECIFIED'), '~', COALESCE(merr.deviceuuid, 'UNSPECIFIED'), '~',
 COALESCE(merr.sessionId, 'UNSPECIFIED')  ) AND mobile.sourceinstance =merr.sourceinstance
 LEFT OUTER JOIN #MDS_TABLE_SCHEMA.MobileCrash_final MobileCrash 
 ON CONCAT( COALESCE(DATE_FORMAT(FROM_UNIXTIME(mobile.timestamp/1000-MOD(mobile.timestamp/1000, 600)), '%Y%m%d%H%i'), 'UNSPECIFIED'), 
 '~', COALESCE(FLOOR(mobile.appid), 'UNSPECIFIED'), '~', COALESCE(CONCAT (mobile.city, ', ', mobile.regioncode, ', ', mobile.countryCode),
 'UNSPECIFIED'), '~', COALESCE(CONCAT(mobile.device, '~', mobile.devicemodel, '~', mobile.osversion, '~', mobile.devicetype), 'UNSPECIFIED'), 
 '~', COALESCE(mobile.deviceuuid, 'UNSPECIFIED'), '~', COALESCE(mobile.sessionId, 'UNSPECIFIED')  )
 = CONCAT( COALESCE(DATE_FORMAT(FROM_UNIXTIME(MobileCrash.timestamp/1000-MOD(MobileCrash.timestamp/1000, 600)), '%Y%m%d%H%i'), 'UNSPECIFIED'),
 '~', COALESCE(FLOOR(MobileCrash.appid), 'UNSPECIFIED'), '~', COALESCE(CONCAT (MobileCrash.city, ', ', MobileCrash.regioncode, ', ',
 MobileCrash.countryCode), 'UNSPECIFIED'), '~', COALESCE(CONCAT(MobileCrash.device, '~', MobileCrash.devicemodel, '~', MobileCrash.osversion,
 '~', MobileCrash.devicetype), 'UNSPECIFIED'), '~', COALESCE(MobileCrash.deviceuuid, 'UNSPECIFIED'), '~',
 COALESCE(MobileCrash.sessionId, 'UNSPECIFIED')  ) AND mobile.sourceinstance = MobileCrash.sourceinstance
 left join #DWH_TABLE_SCHEMA.d_device lov
 on (CONCAT(mobile.device,'~',mobile.deviceModel,'~',mobile.osVersion, '~',mobile.deviceType) = lov.row_id and lov.source_id =mobile.sourceinstance)
 left join #DWH_TABLE_SCHEMA.f_mobile_application_summary TRGT 
 on CONCAT( COALESCE(DATE_FORMAT(FROM_UNIXTIME(mobile.timestamp/1000-MOD(mobile.timestamp/1000,600)),'%Y%m%d%H%i'),'UNSPECIFIED'),
 '~', COALESCE(FLOOR(mobile.appId),'UNSPECIFIED'),'~', COALESCE(CONCAT (mobile.city,', ',mobile.regionCode,', ',mobile.countryCode),'UNSPECIFIED')
 ,'~', COALESCE(CONCAT(mobile.device,'~',mobile.deviceModel,'~',mobile.osVersion, '~', mobile.deviceType),'UNSPECIFIED'),'~',
 COALESCE(mobile.deviceUuid,'UNSPECIFIED'), '~', COALESCE(mobile.sessionId,'UNSPECIFIED') ) = TRGT.row_id
 and mobile.sourceinstance = TRGT.source_id
 where coalesce(case WHEN MobileCrash.category='Crash' THEN 1 ELSE 0 end ,'') 
 <> coalesce(TRGT.mobile_crash_count,'');