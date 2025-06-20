CREATE TABLE DailyActivity (
    Id BIGINT,
    Date DATE,
    TotalSteps INT,
    TotalDistance FLOAT,
    TrackerDistance FLOAT,
    LoggedActivitiesDistance FLOAT,
    VeryActiveDistance FLOAT,
    ModeratelyActiveDistance FLOAT,
    LightActiveDistance FLOAT,
    SedentaryActiveDistance FLOAT,
    VeryActiveMinutes INT,
    FairlyActiveMinutes INT,
    LightlyActiveMinutes INT,
    SedentaryMinutes INT,
    Calories INT,
    TotalSleepRecords INT,
    TotalMinutesAsleep INT,
    TotalTimeInBed INT
);

CREATE TABLE SleepData (
    Id BIGINT,
    Date DATE,
    TotalSteps INT,
    TotalDistance FLOAT,
    TrackerDistance FLOAT,
    LoggedActivitiesDistance FLOAT,
    VeryActiveDistance FLOAT,
    ModeratelyActiveDistance FLOAT,
    LightActiveDistance FLOAT,
    SedentaryActiveDistance FLOAT,
    VeryActiveMinutes INT,
    FairlyActiveMinutes INT,
    LightlyActiveMinutes INT,
    SedentaryMinutes INT,
    Calories INT,
    TotalSleepRecords INT,
    TotalMinutesAsleep INT,
    TotalTimeInBed INT
);
CREATE TABLE HourlyActivity (
    Id BIGINT,
    StepTotal INT,
    Date DATE,
    Hour INT,
    Calories FLOAT,
    TotalIntensity FLOAT,
    AverageIntensity FLOAT,
    AvgHeartRate FLOAT,
    DayOfWeek INT,
    DayType VARCHAR(20));

CREATE TABLE HeartRateHourly(
    Id BIGINT,
    StepTotal INT,
    Date DATE,
    Hour INT,
    Calories FLOAT,
    TotalIntensity FLOAT,
    AverageIntensity FLOAT,
    AvgHeartRate FLOAT);	

--Q1)What is the average number of steps, calories burned, and minutes asleep per user per day?
SELECT Id,
    ROUND(AVG(TotalSteps), 2) AS Avg_StepsPerDay,
    ROUND(AVG(Calories), 2) AS Avg_CaloriesPerDay
FROM DailyActivity 
GROUP BY Id
ORDER BY Id;

SELECT ID, ROUND(avg(totalminutesasleep),2) as AVG_totalminasleep FROM sleepdata
GROUP BY ID
ORDER BY ID;

--Q2) Which users consistently achieve more than 10,000 steps per day and burn over 2,500 calories?
SELECT ID, 
	ROUND(AVG(TOTALSTEPS),2) AS Avg_StepsPerDay ,
	ROUND(AVG(CALORIES),2)AS Avg_CaloriesPerDay 
	FROM DAILYACTIVITY
GROUP BY ID
HAVING AVG(TOTALSTEPS)>=10000 AND AVG(CALORIES)>=2500
ORDER BY ID;

--Q3)What is AVG total time users spend in each activity intensity category (sedentary, light, moderate, very active)?
SELECT ID,
    ROUND(AVG(SedentaryMinutes),2) AS AVG_SedentaryMinutes,
    ROUND(AVG(LightlyActiveMinutes),2) AS AVG_LightActiveMinutes,
    ROUND(AVG(FairlyActiveMinutes),2) AS AVG_lModerateActiveMinutes,
    ROUND(AVG(VeryActiveMinutes),2) AS AVG_VeryActiveMinutes
FROM DailyActivity
GROUP BY ID
ORDER BY ID;

--Q4) Which hours of the day have the highest average steps and calorie burn?

SELECT 
    Hour,
    AVG(StepTotal) AS AvgSteps,
    AVG(Calories) AS AvgCalories
FROM 
    HourlyActivity
GROUP BY Hour
ORDER BY 
    AvgSteps DESC;

--Q5)Compare weekday vs. weekend average step counts per hour. Which period is more active?
SELECT DayType, Hour,
    ROUND(AVG(StepTotal), 2) AS AvgSteps
FROM HourlyActivity
GROUP BY DayType, Hour
ORDER BY AVGSTEPS DESC LIMIT 5;

--Q6) Percentage of Users Getting Less Than 6 Hours Sleep (on Average)

WITH avg_sleep AS (
    SELECT Id, AVG(TotalMinutesAsleep) / 60.0 AS AvgSleepHours
    FROM SleepData
    GROUP BY Id
),
total_counts AS (
    SELECT COUNT(*) AS total FROM avg_sleep
),
below_6 AS (
    SELECT COUNT(*) AS below_6_count FROM avg_sleep WHERE AvgSleepHours < 6
)
SELECT 
    ROUND(100.0 * below_6.below_6_count / total_counts.total, 2) AS UsersBelow6Hours
FROM below_6, total_counts;

--Q7) Which users have the highest and lowest average heart rates?
SELECT Id,
    AVG(AvgHeartRate) AS AvgHeartRate
FROM HeartRateHourly
GROUP BY Id
ORDER BY AvgHeartRate DESC; 

--Q8) Which users are the most and least active based on total steps?
SELECT Id, SUM(TotalSteps) AS TotalSteps
FROM DailyActivity
GROUP BY Id
ORDER BY TotalSteps DESC; 


--Q9) What is the average number of calories burned based on average sleep duration?
SELECT 
    ROUND(S.TotalMinutesAsleep / 60.0, 1) AS SleepHours,
    ROUND(AVG(D.Calories), 0) AS AvgCalories
FROM DailyActivity D
JOIN SleepData S 
  ON D.Id = S.Id AND D.Date = S.Date
WHERE S.TotalMinutesAsleep IS NOT NULL
GROUP BY SleepHours
ORDER BY SleepHours;



