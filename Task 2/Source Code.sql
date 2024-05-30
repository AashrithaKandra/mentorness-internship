use hotel;
select * from hotel_reservation;

#1. What is the total number of reservations in the dataset?

select count(Booking_ID) as No_of_Bookings 
from hotel_reservation;

#2. Which meal plan is the most popular among guests?

select type_of_meal_plan, COUNT(type_of_meal_plan) as no_of_times_ordered
from hotel_reservation
group by type_of_meal_plan
order by no_of_times_ordered desc;

#3. What is the average price per room for reservations involving children?

select avg(avg_price_per_room) as Avg_price_per_room_involving_children
from hotel_reservation
where no_of_children!=0;

#4. How many reservations were made for the year 20XX (replace XX with the desired year)?

select COUNT(booking_id) as Total_no_of_reservations_in_2017
from hotel_reservation
where arrival_date between '2017-01-01' and '2017-12-31';

#5. What is the most commonly booked room type?

select room_type_reserved, COUNT(room_type_reserved) as max_booked_room_type
from hotel_reservation
group by room_type_reserved
order by max_booked_room_type desc
limit 1;

#6. How many reservations fall on a weekend (no_of_weekend_nights > 0)?

select COUNT(booking_id) as no_of_reservations_on_weekend
from hotel_reservation
where no_of_weekend_nights>0;

#7. What is the highest and lowest lead time for reservations?

select MAX(lead_time) as highest_lead_time, MIN(lead_time) as lowest_lead_time
from hotel_reservation;

#8. What is the most common market segment type for reservations?

 select market_segment_type, COUNT(market_segment_type) as most_common_market_segment
 from hotel_reservation
 group by market_segment_type
 order by  most_common_market_segment desc;
 
 #9. How many reservations have a booking status of "Confirmed"?
 
select COUNT(booking_status) as no_of_confirmed_bookings
from hotel_reservation
where booking_status='Not_Canceled';

#10. What is the total number of adults and children across all reservations?

 select sum(no_of_adults) as Total_no_of_adults, sum(no_of_children) as Total_no_of_children
 from hotel_reservation;
 
 #11. What is the average number of weekend nights for reservations involving children?
 
select AVG(no_of_weekend_nights) as avg_of_weekend_nights
from hotel_reservation
where no_of_children!=0;

#12. How many reservations were made in each month of the year?

select COUNT(Booking_Id) as no_of_reservations,MONTH(arrival_date) as Month
  from hotel_reservation
  group by Month(arrival_date)
  order by no_of_reservations desc;
  
  #13. What is the average number of nights (both weekend and weekday) spent by guests for each room type?
  
  select room_type_reserved, AVG(no_of_weekend_nights) as avg_weekend_nights, AVG(no_of_week_nights) as avg_week_nights
  from hotel_reservation
  group by room_type_reserved;

  #14. For reservations involving children, what is the most common room type, and what is the average price for that room type?
  
 select room_type_reserved, COUNT(room_type_reserved) as max_times_reserved, avg(avg_price_per_room) as avg_price_of_room
 from hotel_reservation
 group by room_type_reserved
 order by max_times_reserved desc;
 
 #15. Find the market segment type that generates the highest average price per room?
 
 select market_segment_type, max(avg_price_per_room) as highest_of_avg_price_of_room
 from hotel_reservation
 group by market_segment_type
 order by highest_of_avg_price_of_room desc;
 
  





















