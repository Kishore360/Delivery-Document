select case when count(1)>0 then 'FAILURE' else 'SUCCESS'  END as result ,
CASE WHEN count(1)>0 then 'Data mismatch for d_exceptions_c_exception_comments'  ELSE 'SUCCESS'  END as Message
-- select a.u_exception_comments ,b.exception_comments
from bbandt_mdsdb.u_exception_final a
join bbandt_mdwdb.d_exceptions_c b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where a.u_exception_comments <>b.exception_comments
and a.cdctype='X';


/* Mismatch for 1 record 
Source
CC Tech, Adrianne Hillis Arrived On Site
 Device Exchange Completed, Operation Verified
 Old = WS-2UA95002DF - ACF Complete
 NEW = WS-MJ03KBQ7 - ACF Complete
 Return Tracking 1Z2293819040449818
 Indicates In Transit to Gilley's Delivery ETA XXXX
 
 Target
 CC Tech, Adrianne Hillis Arrived On Site
 Device Exchange Completed, Operation Verified
 Old = WS-2UA95002DF - ACF Complete
 NEW = WS-MJ03KBQ7 - ACF Complete
 Return Tracking 1Z2293819040449818
 Indicates In Transit to Gilley's Delivery ETA 3/18

XXXX is replaced by 3/18 */