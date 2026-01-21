CREATE OR REPLACE VIEW `restaurant_data.actual_vs_predicted` AS

SELECT
  date,
  orders AS actual_orders,
  NULL AS predicted_orders,
  NULL AS recommended_prep,
  NULL AS waste_avoided,
  day,
  weather,
  is_weekend,
  temperature
FROM `restaurant_data.daily_sales`

UNION ALL

SELECT
  date,
  NULL AS actual_orders,
  predicted_orders,
  recommended_prep,
  waste_avoided,
  day,
  weather,
  is_weekend,
  temperature
FROM `restaurant_data.predicted_orders`;
