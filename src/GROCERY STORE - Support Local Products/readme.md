# GROCERY STORE: Support Local Products

You are the owner of the Grocery Store. All your products are in the database, that you have created after CodeWars SQL excercises!:)

You care about local market, and want to check how many products come from United States of America or Canada.

Please use SELECT statement and IN to filter out other origins.

In the results show how many products are from United States of America and Canada respectively.

Order by number of products, descending.

**products table schema**
* id
* name
* price
* stock
* producer
* country

**results table schema**
* products
* country

## Solution
```
SELECT
  COUNT(*) AS products,
  country
FROM products
WHERE 
  country IN ('United States of America', 'Canada')
GROUP BY country
ORDER BY products DESC;
```

## Sample Tests
```
results = run_sql

describe :query do
  describe :syntax do
    it "should contain SELECT" do
      expect($sql.upcase).to include("SELECT")
    end
    
    it "should contain GROUP BY" do
      expect($sql.upcase).to include("GROUP BY")
    end
    
    it "should contain WHERE" do
      expect($sql.upcase).to include("WHERE")
    end
    
    it "should order results" do
      expect($sql.upcase).to include("ORDER BY")
    end
    
    it "should contain IN" do
      expect($sql.upcase).to include("IN")
    end
  end

  describe :columns do
    it "should return 2 columns" do
      expect(results.first.keys.count).to eq 2
    end
    
    it "should contain products column" do
      expect(results.first.keys).to include(:products)
    end
    
    it "should contain country column" do
      expect(results.first.keys).to include(:country)
    end
  end
end
```