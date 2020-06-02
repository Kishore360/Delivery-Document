SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_mobile_application_summary.http_request_errors' ELSE 'SUCCESS' END as Message
from 
(select TRGT.row_id from
(select err.*, round(SUM(case WHEN err.errorType = 'HTTPError' THEN 1 ELSE 0 end),5) dur from #MDS_TABLE_SCHEMA.MobileRequestError_final err
group by err.appid) merr left join #MDS_TABLE_SCHEMA.Mobile_final mobile 
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
 left join #DWH_TABLE_SCHEMA.f_mobile_application_summary TRGT 
 on CONCAT( COALESCE(DATE_FORMAT(FROM_UNIXTIME(mobile.timestamp/1000-MOD(mobile.timestamp/1000,600)),'%Y%m%d%H%i'),'UNSPECIFIED'),
 '~', COALESCE(FLOOR(mobile.appId),'UNSPECIFIED'),'~', COALESCE(CONCAT (mobile.city,', ',mobile.regionCode,', ',mobile.countryCode),'UNSPECIFIED')
 ,'~', COALESCE(CONCAT(mobile.device,'~',mobile.deviceModel,'~',mobile.osVersion, '~', mobile.deviceType),'UNSPECIFIED'),'~',
 COALESCE(mobile.deviceUuid,'UNSPECIFIED'), '~', COALESCE(mobile.sessionId,'UNSPECIFIED') ) = TRGT.row_id
 and mobile.sourceinstance = TRGT.source_id
 where coalesce(merr.dur, '') <> coalesce(TRGT.mobile_http_request_errors)
  union
 select TRGT.row_id 
 from (select me.*, round(SUM(case WHEN me.errorType = 'HTTPError' THEN 1 ELSE 0 end),5) dur 
 from #MDS_TABLE_SCHEMA.MobileRequestError_final me group by sessionId) MobileRequestError
 left join #DWH_TABLE_SCHEMA.f_mobile_application_summary TRGT
 on CONCAT(COALESCE(DATE_FORMAT(FROM_UNIXTIME(MobileRequestError.timestamp/1000-MOD(MobileRequestError.timestamp/1000,600)),'%Y%m%d%H%i')
 ,'UNSPECIFIED'),'~', COALESCE(FLOOR(MobileRequestError.appId),'UNSPECIFIED'),'~', 
 COALESCE(CONCAT (MobileRequestError.city,', ',MobileRequestError.regionCode,', ',MobileRequestError.countryCode),'UNSPECIFIED'),
 '~', COALESCE(CONCAT(MobileRequestError.device,'~',MobileRequestError.deviceModel,'~',MobileRequestError.osVersion, '~',
 MobileRequestError.deviceType),'UNSPECIFIED'),'~', COALESCE(MobileRequestError.deviceUuid,'UNSPECIFIED'), '~', 
 COALESCE(MobileRequestError.sessionId,'UNSPECIFIED')  ) = TRGT.row_id
 and MobileRequestError.sourceinstance = TRGT.source_id
 where coalesce(MobileRequestError.dur,'') <> coalesce(round(TRGT.mobile_http_request_errors,''),5))SQ
 
 
