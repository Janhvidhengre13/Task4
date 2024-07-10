create table student_performance (
	gender varchar(120),
	ethnicity varchar (120),
	 education varchar (120),
	lunch varchar (120),
	     course varchar (120),
	Math_score int default 0 not null,
	reading_score int default 0 not null,
	Writing_score int default 0 not null

)
select * from student_performance

----1.Write a query to select the average Math_score and reading_score for each ethnicity group

select ethnicity,
avg (Math_score) as avg_Math_score,
avg (reading_score) as avg_reading_score
from student_performance
group by ethnicity

---2.how would you retrieve the top 5 students with the highest Math_score
 
	select * from student_performance
order by Math_score desc
limit 5

---3.find the average Math_score and reading_score for each ethnicity group where Math_score is greater than 70, and limit the results to the top 3 groups based on average Math_score

select ethnicity, avg(Math_score) as avg_math_score,
avg(reading_score) as avg_reading_score
from student_performance
where Math_score > 70
group by ethnicity
order by avg_math_score DESC
limit 3

----4.Retrieve the top 5 students with the highest Math_score and reading_score, where Writing_score is less than 80

	select * From student_performance
where Writing_score < 80
order by Math_score DESC, reading_score DESC
limit 5;

---5.Find all students where the Math_score is greater than 70 and the Writing_score is less than 80, and calculate the total and average Math_score for these students

SELECT gender, 
  sum(Math_score) as total_math_score,
avg(Math_score) as avg_math_score
from student_performance
where Math_score > 70 And Writing_score < 80
group By gender
order by avg_math_score desc

--6.Retrieve records where the ethnicity is either 'Group A' or 'Group B', and calculate the total and average reading_score for these groups, ordering by total reading_score

select ethnicity,
sum(reading_score) as sum_reading_score, 
avg(reading_score) as avg_reading_score
from student_performance
where ethnicity in ('Group A', 'Group B')
group by ethnicity
ORDER BY sum_reading_score Desc

---7.Find students whose reading_score is between 60 and 80, and calculate the total and average Writing_score for these students,limiting the results to the top 3 based on total Writing_score

Select gender, 
  sum(Writing_score) AS sum_writing_score,
   avg(Writing_score) AS avg_writing_score
from student_performance
where reading_score between 60 And 80
group bY gender
order  by sum_writing_score DESC
LIMIT 3

---8.Retrieve the records of students who scored less than 50 in both reading_score and Writing_score, and calculate the total and average Math_score for these students, ordering by total Math_score in ascending order

select gender, Sum(Math_score) as total_math_score, avg (Math_score) as avg_math_score
from student_performance
where reading_score < 50 And Writing_score < 50
group by gender
order by total_math_score ASC

--- 9.Select the count of students grouped by gender and order the result by the count in descending order, limiting to the top 2 genders with the highest count where Math_score is greater than 50

  select gender, Count(*) as student_count
from student_performance
where Math_score > 50
group by gender
order by student_count DESC
limit 2

---10. find the minimum and maximum Math_score for each education level, where the Math_score is greater than 40, and order by maximum Math_score in descending order
select education, min(Math_score) as min_math_score, max(Math_score) as max_math_score
from student_performance
where Math_score > 40
group by education
order by max_math_score desc



