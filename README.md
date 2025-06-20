📊 Overview
This project provides a complete analysis of fitness and health metrics using STRAVA data. The pipeline involves data cleaning and processing in Python, SQL-based querying for insights, and an interactive Power BI dashboard to visualize user activity patterns.

✅ Tools Used: Python (Pandas, Seaborn, Matplotlib), SQL, Power BI

📁 Data Sources
The dataset includes multiple CSV files tracking:
Daily and hourly activity
Sleep patterns
Calories burned
Heart rate
Weight logs

🧹 Data Cleaning (Python)
CSV files cleaned:
dailyActivity_merged.csv
dailyCalories_merged.csv
dailyIntensities_merged.csv
sleepDay_merged.csv
weightLogInfo_merged.csv
heartrate_seconds_merged.csv
HourlySteps_merged.csv
HourlyCalories_merged.csv
HourlyIntensities_merged.csv

Steps performed:
Date-time formatting & feature extraction (Date, Hour)
Removed duplicates
Renamed columns for consistency
Dropped unnecessary or redundant columns
Merged data into unified DataFrames for daily and hourly insights

✅ Python Graphs Included
Daily Steps vs. Calories Burned (Scatter plot + regression line)
Sleep Duration Distribution and Quality Analysis(Histogram and scatter plots)
Activity Intensity Breakdown(Bar plot for minutes and distance)
Hourly Activity Intensity vs. Heart Rate(Heatmap)
Hourly Distribution of Average Heart Rate(Box plot)
Total Intensity vs. Average Heart Rate(Scatter plot)
Hourly Steps Trends(Line plot: Hours of Day vs Average Steps)
Weekday vs Weekend Step Patterns(Line plot comparing average hourly steps)
Daily Activity Minutes Distribution(Pie chart)
Hourly Calorie Burn Patterns(Line plot)

🧠 SQL-Based Analysis
Insights Generated:
Avg steps, calories burned, and minutes slept per user per day
Identify users with consistently >10,000 steps and >2,500 calories
Average time in each intensity zone (sedentary, light, moderate, very active)
Peak activity hours and calorie burn
Weekday vs weekend hourly step patterns
% of users sleeping less than 6 hours
Highest & lowest average heart rate users
Most & least active users
Calorie burn correlation with sleep duration

📈 Power BI Dashboard Highlights
The Power BI dashboard delivers clear, insightful, and interactive visualizations, including:
Steps, calories, and intensity breakdown
User-wise and time-based comparisons
Hourly trends (steps, calories, heart rate)
Sleep quality and heart rate correlation
Weekday vs weekend analysis
