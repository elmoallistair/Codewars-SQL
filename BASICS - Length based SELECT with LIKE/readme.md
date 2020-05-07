# BASICS: Length based SELECT with LIKE

You will need to create SELECT statement in conjunction with LIKE.

Please list people which have first_name with at least 6 character long

**names table schema**
* id
* first_name
* last_name

**results table schema**
* first_name
* last_name

## Solution
```
SELECT
  first_name,
  last_name
FROM names
WHERE first_name LIKE '______%';
```

## Sample Tests
```
results = run_sql

describe :query do
  describe :syntax do
    it "should contain SELECT" do
      expect($sql.upcase).to include("SELECT")
    end
    
    it "should contain WHERE" do
      expect($sql.upcase).to include("WHERE")
    end
    
    it "should contain LIKE" do
      expect($sql.upcase).to include("LIKE")
    end
    
    it "should not contain LEN" do
      expect($sql.upcase).not_to include("LEN")
    end
  end
  
  describe :columns do
    it "should return 2 columns" do
      expect(results.first.keys.count).to eq 2
    end
    
    it "should contain first_name column" do
      expect(results.first.keys).to include(:first_name)
    end
    
    it "should contain last_name column" do
      expect(results.first.keys).to include(:last_name)
    end
  end
end
```