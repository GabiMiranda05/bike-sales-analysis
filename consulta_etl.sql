WITH cte AS (
  SELECT dteday, season, yr, rider_type, riders, price, COGS
  FROM bike_share_yr_0
  UNION ALL
  SELECT dteday, season, yr, rider_type, riders, price, COGS
  FROM bike_share_yr_1
)

SELECT cte.*,
       (riders * price) AS revenue,
       ((riders * price) - COGS) AS profit
FROM cte
LEFT JOIN cost_table ON cte.yr = cost_table.yr;
