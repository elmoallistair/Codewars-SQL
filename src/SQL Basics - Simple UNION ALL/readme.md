# SQL Basics: Simple UNION ALL

For this challenge you need to create a UNION statement, there are two tables `ussales` and `eusales` the parent company tracks each sale at its respective location in each table, you must all filter the sale price so it only returns rows with a sale greater than `50.00`. You have been tasked with combining that data for future analysis. Order by location (US before EU), then by id.

**(us/eu)sales table schema**
* id
* name
* price
* card_name
* card_number
* transaction_date

**resultant table schema**
* location (EU for eusales and US for ussales)
* id
* name
* price (greater than 50.00)
* card_name
* card_number
* transaction_date

> NOTE: Your solution should use pure SQL. Ruby is used within the test cases to do the actual testing.

## Solution
```
ALTER TABLE ussales ADD COLUMN location VARCHAR(2) DEFAULT 'US';
ALTER TABLE eusales ADD COLUMN location VARCHAR(2) DEFAULT 'EU';

SELECT * FROM ussales WHERE price > 50.00
UNION ALL
SELECT * FROM eusales WHERE price > 50.00
ORDER BY location DESC, id
```

## Sample Tests
```
results = run_sql

describe :query do
  describe "should contain keywords" do    
    it "should contain UNION ALL" do
      expect($sql.upcase).to include("UNION ALL")
    end
    
    it "should contain EU" do
      expect($sql.upcase).to include("EU")
    end
    
    it "should contain US" do
      expect($sql.upcase).to include("US")
    end
    
    it "should not contain JOIN" do
      expect($sql.upcase).not_to include("JOIN")
    end
  end

  describe :columns do
    it "should return 7 columns" do
      expect(results.first.keys.count).to eq 7
    end
    
    it "should return a location column" do
      expect(results.first.keys).to include(:location)
    end
    
    it "should return an id column" do
      expect(results.first.keys).to include(:id)
    end
    
    it "should return a name column" do
      expect(results.first.keys).to include(:name)
    end
    
    it "should return a price column" do
      expect(results.first.keys).to include(:price)
    end
    
    it "should return a card_name column" do
      expect(results.first.keys).to include(:card_name)
    end
    
    it "should return a card_number column" do
      expect(results.first.keys).to include(:card_number)
    end
    
    it "should return a transaction_date column" do
      expect(results.first.keys).to include(:transaction_date)
    end
  end
end
```
