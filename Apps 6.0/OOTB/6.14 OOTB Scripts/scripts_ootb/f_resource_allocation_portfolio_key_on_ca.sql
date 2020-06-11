SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_resource_allocation.PORTFOLIO_KEY' ELSE 'SUCCESS' END as Message
FROM
(SELECT 
prassignment.sourceinstance AS source_id,
CONCAT('ASSIGNED~', prassignment.PRID, '', prassignment.PRRESOURCEID, '', DATE_FORMAT(prj_blb_slices.SLICE_DATE, '%Y%m%d')) AS row_id,
prassignment.cdctype AS cdctype,
prassignment.PRTASKID AS PROJECTTASKID,
prtask.PRPROJECTID AS PROJECTID,
prassignment.PRRESOURCEID AS RESOURCEID,
prj_blb_slices.SLICE_DATE AS SLICE_DATE,
SUM(prj_blb_slices.SLICE) AS SLICE_VALUE,
prassignment.PRID AS PRID,
prassignment.sourceinstance prassignment_sourceinstance,
prassignment.PRTASKID prassignment_PRTASKID
FROM
#MDS_TABLE_SCHEMA.prassignment_final prassignment
INNER JOIN #MDS_TABLE_SCHEMA.prtask_final prtask ON prassignment.PRTASKID = prtask.PRID
AND prassignment.sourceinstance = prtask.sourceinstance
LEFT OUTER JOIN #MDS_TABLE_SCHEMA.inv_investments_final inv_investments ON prtask.PRPROJECTID = inv_investments.ID
AND prtask.sourceinstance = inv_investments.sourceinstance
LEFT OUTER JOIN #MDS_TABLE_SCHEMA.inv_projects_final inv_projects ON inv_investments.ID = inv_projects.PRID
AND inv_investments.sourceinstance = inv_projects.sourceinstance
LEFT OUTER JOIN #MDS_TABLE_SCHEMA.prj_blb_slices_final prj_blb_slices ON prassignment.PRID = prj_blb_slices.PRJ_OBJECT_ID
AND prassignment.sourceinstance = prj_blb_slices.sourceinstance
INNER JOIN #MDS_TABLE_SCHEMA.prj_blb_slicerequests_final prj_blb_slicerequests ON prj_blb_slices.SLICE_REQUEST_ID = prj_blb_slicerequests.ID
AND prj_blb_slices.sourceinstance = prj_blb_slicerequests.sourceinstance
WHERE
UPPER(inv_investments.ODF_OBJECT_CODE) = 'PROJECT'
AND inv_projects.IS_TEMPLATE = 0
AND UPPER(prj_blb_slicerequests.REQUEST_NAME) IN ('DAILYRESOURCEACTCURVE' , 'DAILYRESOURCEESTCURVE')
AND prassignment.CDCTYPE <> 'D'
AND prtask.CDCTYPE <> 'D'
AND inv_investments.CDCTYPE <> 'D'
AND inv_projects.CDCTYPE <> 'D'
GROUP BY 1 , 2 , 3 , 4 , 5 , 6 , 7 , 9) src
LEFT JOIN
(SELECT 
SRC_1.INVESTMENT_ID AS INVESTMENT_ID,
D_PORT.ROW_KEY PORTFOLIO_KEY
FROM
(SELECT 
T1.INVESTMENT_ID, T2.PORTFOLIO_ID
FROM
(SELECT 
INVESTMENT_ID, MIN(ID) AS ID
FROM
#MDS_TABLE_SCHEMA.pfm_investments_final
WHERE
UPPER(ODF_OBJECT_CODE) = 'PROJECT'
GROUP BY INVESTMENT_ID) T1 INNER
JOIN (SELECT 
PORTFOLIO_ID, INVESTMENT_ID, ID
FROM
#MDS_TABLE_SCHEMA.pfm_investments_final
WHERE
PORT_INV_STATUS = 1) T2 ON T1.INVESTMENT_ID = T2.INVESTMENT_ID
AND T1.ID = T2.ID) SRC_1
LEFT OUTER JOIN #DWH_TABLE_SCHEMA.d_portfolio D_PORT ON D_PORT.ROW_ID = SRC_1.PORTFOLIO_ID) src2 ON src.prassignment_PRTASKID = src2.INVESTMENT_ID
LEFT JOIN
#DWH_TABLE_SCHEMA.f_resource_allocation trg ON src.row_id = trg.row_id
AND src.prassignment_sourceinstance = trg.source_id
WHERE
trg.row_id LIKE '%ASSIGNED%'
AND COALESCE(src2.PORTFOLIO_KEY, '') <> COALESCE(trg.PORTFOLIO_KEY, '');