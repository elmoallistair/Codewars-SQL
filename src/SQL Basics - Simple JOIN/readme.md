# SQL Basics: Simple JOIN

For this challenge you need to create a simple SELECT statement that will return all columns from the `products` table, 
and join to the `companies` table so that you can return the company name.

**products table schema**
* id
* name
* isbn
* company_id
* price

**companies table schema**
* id
* name

You should return all product fields as well as the company name as "company_name".
> NOTE: You're solution should use pure SQL. Ruby is used within the test cases to do the actual testing.

## Solution
```
SELECT    
  p.*,
  c.name AS company_name
FROM products AS p
  LEFT JOIN companies AS c
  ON p.company_id = c.id;
```

## Sample Tests
```
results = run_sql

describe :items do
   it "should return 10 items" do
    expect(results.count).to eq 10
   end

   it "should return isbn numbers" do
     results.each do |result|
       expect(result[:isbn]).to be_a String
     end
   end
   
   it "should return names" do
     results.each do |result|
       expect(result[:name]).to eq find_record(:products, result[:id]).name
     end
   end
   
   it "should return company names" do
    results.each do |result|
      company = find_record(:companies, result[:company_id])
      expect(result[:company_name]).to eq company.name
    end
   end
end
```