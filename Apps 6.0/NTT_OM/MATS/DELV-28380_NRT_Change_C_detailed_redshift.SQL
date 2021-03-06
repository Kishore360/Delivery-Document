
/* Tables Accessed:
VW_CHANGE_REQUEST
VW_CHANGE_REQUEST_ASSIGNMENT_GROUP
VW_CHANGE_REQUEST_ASSIGNMENT_GROUP_MANAGER
VW_CHANGE_REQUEST_CLOSED_CALENDAR_DATE
VW_CHANGE_REQUEST_CONFIGURATION_ITEM
VW_CHANGE_REQUEST_END_CALENDAR_DATE
VW_CHANGE_REQUEST_LOCATION
VW_CHANGE_REQUEST_OPENED_BY
VW_CHANGE_REQUEST_OPENED_CALENDAR_DATE
VW_CHANGE_REQUEST_START_CALENDAR_DATE
VW_LOV_CHANGE_REQUEST_STATE
 */
SELECT 'VW_CHANGE_REQUEST',Count(1) as CNT 
FROM VW_CHANGE_REQUEST
UNION 
SELECT 'VW_CHANGE_REQUEST_ASSIGNMENT_GROUP',Count(1) as CNT 
FROM VW_CHANGE_REQUEST a 
LEFT OUTER JOIN VW_CHANGE_REQUEST_ASSIGNMENT_GROUP b ON a.ASSIGNMENT_GROUP=b.sys_id 
UNION 
SELECT 'VW_CHANGE_REQUEST_ASSIGNMENT_GROUP_MANAGER',Count(1) as CNT 
FROM VW_CHANGE_REQUEST a 
LEFT OUTER JOIN VW_CHANGE_REQUEST_ASSIGNMENT_GROUP b ON a.ASSIGNMENT_GROUP=b.sys_id 
LEFT OUTER JOIN VW_CHANGE_REQUEST_ASSIGNMENT_GROUP_MANAGER c ON b.MANAGER=c.sys_id 
UNION 
SELECT 'VW_CHANGE_REQUEST_CLOSED_CALENDAR_DATE',Count(1) as CNT 
FROM VW_CHANGE_REQUEST a 
LEFT OUTER JOIN VW_CHANGE_REQUEST_CLOSED_CALENDAR_DATE b ON a.CLOSED_ON_KEY=b.sys_id 
UNION
SELECT 'VW_CHANGE_REQUEST_CONFIGURATION_ITEM',Count(1) as CNT 
FROM VW_CHANGE_REQUEST a 
LEFT OUTER JOIN VW_CHANGE_REQUEST_CONFIGURATION_ITEM b ON a.CMDB_CI=b.sys_id
UNION 
SELECT 'VW_CHANGE_REQUEST_END_CALENDAR_DATE',Count(1) as CNT 
FROM VW_CHANGE_REQUEST a 
LEFT OUTER JOIN VW_CHANGE_REQUEST_END_CALENDAR_DATE b ON a.END_ON_KEY=b.sys_id 
UNION 
SELECT 'VW_CHANGE_REQUEST_LOCATION',Count(1) as CNT 
FROM VW_CHANGE_REQUEST a 
LEFT OUTER JOIN VW_CHANGE_REQUEST_LOCATION b ON a.LOCATION=b.sys_id 
UNION 
SELECT 'VW_CHANGE_REQUEST_OPENED_BY',Count(1) as CNT 
FROM VW_CHANGE_REQUEST a 
LEFT OUTER JOIN VW_CHANGE_REQUEST_OPENED_BY b ON a.OPENED_BY=b.sys_id
UNION 
SELECT 'VW_LOV_CHANGE_REQUEST_STATE',Count(1) as CNT 
FROM VW_CHANGE_REQUEST a 
LEFT OUTER JOIN VW_LOV_CHANGE_REQUEST_STATE b ON a.STATE=b.sys_id 
UNION 
SELECT 'VW_CHANGE_REQUEST_START_CALENDAR_DATE',Count(1) as CNT 
FROM VW_CHANGE_REQUEST a 
LEFT OUTER JOIN VW_CHANGE_REQUEST_START_CALENDAR_DATE b ON a.START_ON_KEY=b.sys_id 
UNION 
SELECT 'VW_CHANGE_REQUEST_OPENED_CALENDAR_DATE',Count(1) as CNT 
FROM VW_CHANGE_REQUEST a 
LEFT OUTER JOIN VW_CHANGE_REQUEST_OPENED_CALENDAR_DATE b ON a.OPENED_ON_KEY=b.sys_id 

