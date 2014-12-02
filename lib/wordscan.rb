class WordScan

  @@defaultGeorgeCarlin = {"sevenDirtyWords" => ["Shit","Piss","Fuck","Cunt","Cocksucker","Motherfucker","Tits"]}

  def initialize(nestedArrayInHash = @@defaultGeorgeCarlin )
    #instance variable
    @original = nestedArrayInHash 
    @wordScan = @original 
    @searchString = ""
  end

  def orConditional(wordScan = @wordScan, searchString = @searchString)
    # Phrases are changed into acceptable input for Twitter Search API

    wordScan.each {|key, value|   

      value.collect! {|i|
        if i.include?(" ")
          i = "(#{i})"
        else
          i = i
        end
      }

      # Adds the OR conditional at the end of each hash value
      # this joins the values into a single conditional for the Twitter API
      if value[-1]
        value[-1] = value[-1] + " OR "
      end
    }


    wordScan.each {|key, value| 
      # Add all the values to a single string with conditional

      searchString << value.join(" OR ")

      # removes the dangling " OR " from the string 
      searchString = searchString[0..-4]
    }

    return searchString
  end
end