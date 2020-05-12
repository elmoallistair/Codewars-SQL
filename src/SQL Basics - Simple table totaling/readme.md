# SQL Basics: Simple table totaling.

For this challenge you need to create a simple query to display each unique clan with their total points and ranked by their total points.

**people table schema**
* name
* points
* clan

You should then return a table that resembles below

**select on**
* rank
* clan
* total_points
* total_people

The query must rank each clan by their total_points, you must return each unqiue clan and if there is no clan name (i.e. it's an empty string) you must replace it with `[no clan specified]`, you must sum the total_points for each clan and the total_people within that clan.

**Note The data is loaded from the live leaderboard, this means values will change but also could cause the kata to time out retreiving the information.**

> NOTE: You're solution should use pure SQL. Ruby is used within the test cases to do the actual testing.

## Solution
```
SELECT
  RANK() OVER (ORDER BY SUM(points) DESC) AS rank,
  COALESCE(NULLIF(clan,''), '[no clan specified]') AS clan,
  SUM(points) AS total_points,
  COUNT(name) AS total_people
FROM people
  GROUP BY clan;
```

## Sample Tests
```
results = run_sql

describe :items do
   it "should return all unique clan names" do
     clan_names = []
     results.each do |result|
       expect(clan_names).to satisfy { |value| value != result[:clan] }
       clan_names.push(result[:clan])
     end
   end
   
   
   it "should order by total_points descending" do
     last_highest = Float::INFINITY
     results.each do |result|
       expect(result[:total_points]).to be <= last_highest
       last_highest = result[:total_points]
     end
   end
   
   it "ranking should be in ascending order" do
     last_highest = 0
     results.each do |result|
       expect(result[:rank]).to be >= last_highest
       last_highest = result[:rank]
     end
   end
   
   it "sum of total people should equal 100" do
     sum_of_total_people = 0
     results.each do |result|
       sum_of_total_people += result[:total_people]
     end
     expect(sum_of_total_people).to eq 100
   end
end
```