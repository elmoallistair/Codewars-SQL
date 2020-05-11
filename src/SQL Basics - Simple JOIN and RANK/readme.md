# SQL Basics - Simple JOIN and RANK

For this challenge you need to create a simple SELECT statement that will return all columns from the `people` table, and join to the `sales` table so that you can return the COUNT of all sales and RANK each person by their sale_count.

**people table schema**
* id
* name

**sales table schema**
* id
* people_id
* sale
* price

You should return all people fields as well as the sale count as "sale_count" and the rank as "sale_rank".

> NOTE: Your solution should use pure SQL. Ruby is used within the test cases to do the actual testing.

## Solution
```
SELECT
  p.id,
  p.name,
  COUNT(s.sale) as sale_count,
  RANK() OVER (ORDER BY COUNT(s.sale)) as sale_rank
FROM people as p
JOIN sales as s
  ON p.id = s.people_id
GROUP BY p.id
```

## Sample Tests
```
results = run_sql

describe :items do
   it "should return 10 items" do
    expect(results.count).to eq 10
   end
   
   it "should return names" do
     results.each do |result|
       expect(result[:name]).to eq find_record(:people, result[:id]).name
     end
   end
   
   it "should return sales count" do
    results.each do |result|
      sales = find_records_by_people_id(:sales, result[:id])
      expect(result[:sale_count]).to eq sales.count
    end
   end
   
   it "ranking should be in order" do
     last_highest = 1
     results.each do |result|
       expect(result[:sale_rank]).to be >= last_highest
       last_highest = result[:sale_rank]
     end
   end
end
```
