# SQL Basics: Simple EXIST

For this challenge you need to create a SELECT statement, this SELECT statement will use an EXISTS to check whether a department has had a sale with a price over 98.00 dollars.

**departments table schema**
* id
* name

**sales table schema**
* id
* department_id (department foreign key)
* name
* price
* card_name
* card_number
* transaction_date

**resultant table schema**
* id
* name

> NOTE: Your solution should use pure SQL. Ruby is used within the test cases to do the actual testing. Do not: alias tables as this can cause a failure.

## Solution
```
SELECT 
  id, name
FROM departments
WHERE EXISTS (
  SELECT department_id
  FROM sales
  WHERE (
    departments.id = sales.department_id AND price > 98.00
  )
);
```

## Sample Tests
```
results = run_sql

describe :query do
  describe "should contain keywords" do    
    it "should contain EXISTS" do
      expect($sql.upcase).to include("EXISTS")
    end
    
    it "should contain WHERE" do
      expect($sql.upcase).to include("WHERE")
    end
        
    it "should not contain IN" do
      expect($sql.upcase).not_to include(" IN ")
    end
  end

  describe :columns do
    it "should return 2 columns" do
      expect(results.first.keys.count).to eq 2
    end
    
    it "should return an id column" do
      expect(results.first.keys).to include(:id)
    end
    
    it "should return a name column" do
      expect(results.first.keys).to include(:name)
    end
  end
end
```
