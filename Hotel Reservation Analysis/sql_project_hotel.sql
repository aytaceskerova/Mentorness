--1. What is the total number of reservations in the dataset?
SELECT COUNT(Booking_ID) AS Total_Reservations
FROM hotel_res

--2. Which meal plan is the most popular among guests?
SELECT TOP 1 type_of_meal_plan,COUNT(*) AS Popularity
FROM hotel_res
GROUP BY type_of_meal_plan

--3. What is the average price per room for reservations involving children?
SELECT AVG(avg_price_per_room) AS Average_Price
FROM hotel_res
WHERE no_of_children > 0

--4. How many reservations were made for the year 20XX (replace XX with the desired year)?
SELECT COUNT(Booking_ID) AS Reservations_Year_2018
FROM hotel_res
WHERE YEAR(arrival_date) = 2018

--5. What is the most commonly booked room type?
SELECT TOP 1 room_type_reserved as [Type of Room],Count(*) as Frequency
FROM hotel_res
GROUP BY room_type_reserved
ORDER BY Frequency DESC

--6. How many reservations fall on a weekend (no_of_weekend_nights > 0)?
SELECT COUNT(*) AS [Number of Reservation]
FROM hotel_res
WHERE no_of_weekend_nights > 0

--7. What is the highest and lowest lead time for reservations?
SELECT 
    MAX(lead_time)  as max_time,
    MIN(lead_time)  as min_time
FROM hotel_res

--8. What is the most common market segment type for reservations?
SELECT TOP 1 market_segment_type , COUNT(*) AS Frequency
FROM hotel_res
GROUP BY market_segment_type 
ORDER BY Frequency DESC

--9. How many reservations have a booking status of "Confirmed"?
SELECT COUNT(booking_status) as confirmed_booking
FROM hotel_res
WHERE booking_status = 'Not_Canceled'

--10. What is the total number of adults and children across all reservations?
SELECT SUM(no_of_adults) AS total_num_adults, Sum(no_of_children) AS total_num_children
FROM hotel_res

--11. What is the average number of weekend nights for reservations involving children?
SELECT AVG(no_of_weekend_nights) AS Avg_Weekend_Nights
FROM hotel_res
WHERE no_of_children > 0

--12. How many reservations were made in each month of the year?
SELECT MONTH(arrival_date) AS Month, COUNT(Booking_ID) AS Reservations
FROM hotel_res
GROUP BY MONTH(arrival_date)
ORDER BY Month

--13. What is the average number of nights (both weekend and weekday) spent by guests for each room type?
SELECT room_type_reserved,AVG(no_of_weekend_nights+no_of_week_nights) AS Avg_Total_Nights
FROM hotel_res
GROUP BY room_type_reserved

--14. For reservations involving children, what is the most common room type, and what is the average price for that room type?
SELECT TOP 1 room_type_reserved, COUNT(*) AS Frequency, AVG(avg_price_per_room) AS Avg_Price
FROM hotel_res
WHERE no_of_children > 0
GROUP BY room_type_reserved
ORDER BY Frequency DESC

--15. Find the market segment type that generates the highest average price per room.
SELECT TOP 1 market_segment_type, 
       AVG(avg_price_per_room) AS Avg_Price
FROM hotel_res
GROUP BY market_segment_type
ORDER BY Avg_Price DESC