# 🍽️ Meal Predict  
AI-Powered Demand Forecasting & Food Waste Reduction System

---

## 📌 Problem Statement

Small restaurants and cloud kitchens often rely on manual estimates to decide how much food to prepare each day. This results in:

- Over-preparation leading to food waste  
- Under-preparation causing lost revenue  
- Increased operational costs  
- Lack of data-driven decision making  

Affordable and simple demand forecasting solutions are rarely accessible to small food businesses.

---

## 💡 Solution Overview

**Meal Predict** is a data-driven system that forecasts daily food demand and recommends optimal preparation quantities using machine learning.

The system:
- Learns demand patterns from historical data
- Predicts future orders based on day type, weather, and temperature
- Recommends how much food to prepare
- Estimates food waste avoided
- Visualizes insights using an interactive dashboard

> To demonstrate scalability, the solution uses **realistic simulated data** that reflects real-world restaurant behavior.

---

## 🚀 Key Features

- Daily demand prediction using machine learning  
- Recommended food preparation quantity  
- Estimated food waste avoided  
- Historical vs predicted demand comparison  
- Day-wise and weather-wise demand analysis  
- Interactive dashboard filters  
- Scalable and extensible design  

---

## 🧠 Model Details

- **Model Used:** Random Forest Regressor  
- **Input Features:**
  - Day of the week  
  - Weekend / weekday  
  - Weather condition  
  - Temperature  
- **Target Variable:** Number of orders  
- **Evaluation Metric:** Mean Absolute Error (MAE)  

Categorical features are encoded internally for training, while all outputs remain human-readable.

---

## 🏗️ System Architecture

---

## 🛠️ Google Technologies Used

- **Google BigQuery**
  - Stores historical and predicted sales data  
  - Enables fast analytical queries  

- **Google Colab**
  - Data generation  
  - Machine learning model training  
  - Future demand prediction  

- **Google Looker Studio**
  - Interactive dashboards  
  - Business insights visualization  

All tools are used without requiring a billing account.

---

## 📊 Dataset Description

### `daily_sales`
| Column | Description |
|------|------------|
| date | Date |
| day | Day of week |
| is_weekend | Boolean (True / False) |
| weather | Weather condition |
| temperature | Temperature (°C) |
| orders | Actual number of orders |

### `predicted_orders`
| Column | Description |
|------|------------|
| date | Future date |
| day | Day of week |
| is_weekend | Boolean |
| weather | Weather condition |
| temperature | Temperature |
| predicted_orders | Forecasted demand |
| recommended_prep | Suggested preparation quantity |
| waste_avoided | Estimated food waste avoided |

---

## 🧾 BigQuery View Used

```sql
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
