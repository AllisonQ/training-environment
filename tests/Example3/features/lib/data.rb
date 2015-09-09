#Function: improves maintainability of tests - details can be easily added to or amended
#can be called by many features
def set_details()
@details = {"forename" => "Allison",
  "surname" => "Deckard",
  "address" => {"house_number" => "3",
            "street" => "Tyrell Road",
            "city" => "Plymouth",
            "postcode" => "PL4 5AZ"},
  "sex" => "html/body/div[1]/form/input[8]",
  "interests" => "cycling",
  "car" => "Audi"
  }
end
