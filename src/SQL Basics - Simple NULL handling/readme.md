# SQL Basics: Simple NULL handling

For this challenge you need to create a SELECT statement, this select statement must have NULL handling, using COALESCE and NULLIF.

If no `name` is specified you must replace with `[product name not found]`

If no `card_name` is specified you must replace with `[card name not found]`

If no `price` is specified you must throw away the record, you must also filter the dataset by prices greater than 50.

**eusales table schema**
* id
* name
* price
* card_name
* card_number
* transaction_date

**resultant table schema**
* id
* name
* price (greater than 50.00)
* card_name
* card_number
* transaction_date

> NOTE: Your solution should use pure SQL. Ruby is used within the test cases to do the actual testing.

## Solution
```
SELECT
  id,
  COALESCE(NULLIF(name, ''), '[product name not found]') AS name,
  price,
  COALESCE(NULLIF(card_name, ''), '[card name not found]') AS card_name,
  card_number,
  transaction_date
FROM eusales
WHERE price > 50;
```

## Sample Tests
```
results = run_sql

describe :query do
  describe "should contain keywords" do    
    it "should contain COALESCE" do
      expect($sql.upcase).to include("COALESCE")
    end
    
    it "should contain NULLIF" do
      expect($sql.upcase).to include("NULLIF")
    end
    
    it "should contain WHERE" do
      expect($sql.upcase).to include("WHERE")
    end
  end

  describe :columns do
    it "should return 6 columns" do
      expect(results.first.keys.count).to eq 6
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