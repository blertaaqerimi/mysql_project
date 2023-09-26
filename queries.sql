-- 1. Selekto autobusin me kapacitetin me te madh 
select * from buses order by capacity desc limit 1;

-- 2. Gjej oraret e autobusit 4
select b.* from busschedule bs join buses b on b.BusID=bs.BusId where b.BusNumber='Bus-004';

-- 3. Selekto te gjithe pasagjeret 
select p.* from passengers p join trip_passenger tp on p.PassengerID=tp.PassengerID 
join bustrips bt on bt.TripID=tp.TripID 
join busschedule bs on bs.ScheduleId=bt.ScheduleID 
join buses b on b.BusID=bs.BusId
where bt.TripDate='2023-09-20' and bs.DepartureTime='08:00:00' and b.BusNumber='Bus-001';

-- 4. gjej kapacitetin me te madh qe posedon ndonje autobus
select max(capacity) as 'kapaciteti me i madh' from buses;

-- 5. selekto rruget me gjatesi me te madhe se 25km
select RouteName, TotalDistance from routes where TotalDistance > 25;

-- 6. gjej rrugen me distancen me te shkurte
select * from routes order by TotalDistance limit 1;

-- 7. Gjej te gjithe stopat e rruges A
select bs.* from busstops bs join routestops rs on bs.StopID=rs.StopID
join routes r on r.RouteID=rs.RouteID
where r.RouteName='Route A';

-- 8. Gjej te gjithe autobusat qe kalojne neper stopin 4
select buses.* from busstops join busschedule on busstops.StopID=busschedule.StopID
join buses on busschedule.BusId=buses.BusID
where busstops.StopName='Stop 4';

-- 9. Selekto udhetimet e autobuseve dhe numrin e udhetarve per udhetim
select bt.TripDate, bs.DepartureTime, bs.ArrivalTime, b.BusNumber, count(tp.PassengerID) as 'numri i udhetareve' 
from trip_passenger tp
join bustrips bt on bt.tripID=tp.TripID
join busschedule bs on bs.ScheduleId=bt.ScheduleId
join buses b on b.BusID=bs.BusId
group by tp.TripID;

-- 10. Gjej autobusin qe ka pasur udhetare me se shumti dhe orarin ne te cilin e ka kryer udhetimin
select bt.TripDate, bs.DepartureTime, bs.ArrivalTime, b.BusNumber, count(tp.PassengerID) as numriiudhetareve 
from trip_passenger tp
join bustrips bt on bt.tripID=tp.TripID
join busschedule bs on bs.ScheduleId=bt.ScheduleId
join buses b on b.BusID=bs.BusId
group by tp.TripID
order by  numriiudhetareve desc 
limit 1;


