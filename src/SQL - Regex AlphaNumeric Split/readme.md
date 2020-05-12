# SQL: Regex AlphaNumeric Split

You are given a table named repositories, format as below:

**repositories table schema**
* project
* commits
* contributors
* address

The table shows project names of major cryptocurrencies, their numbers of commits and contributors and also a random donation address ( not linked in any way :) ).

Your job is to split out the letters and numbers from the address provided, and return a table in the following format:

**output table schema**
* project
* letters
* numbers

Case should be maintained.

## Solution
```
SELECT
  project,
  regexp_replace(address,'[0-9]','','g') as letters,
  regexp_replace(address,'[a-zA-Z]','','g') as numbers 
FROM repositories;
```

## Solution Code
```
results = run_sql

describe :query do
  describe "should contain keywords" do
    it "should contain SELECT" do
      expect($sql.upcase).to include("SELECT")
    end

    it "should contain FROM" do
      expect($sql.upcase).to include("FROM")
    end
  end

  describe :columns do
    it "should return 3 columns" do
      expect(results.first.keys.count).to eq 3
    end
    
    it "should return a project column" do
      expect(results.first.keys).to include(:project)
    end

    it "should return a letters column" do
      expect(results.first.keys).to include(:letters)
    end
    
    it "should return a numbers column" do
      expect(results.first.keys).to include(:numbers)
    end
  end
end
```