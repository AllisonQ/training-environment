#Function: improves maintainability of tests - details can be easily added to or amended
#can be called by many features
 
def set_details_1()
@details = Hash.new()
@details['first-name'] = "Rick"
@details['second-name'] = "Deckard"
@details['address'] = Hash.new()
@details['address']['house-number'] = "3"
@details['address']['street'] = "Tyrell Road"
@details['address']['city'] = "Plymouth"
@details['address']['postcode'] = "PL4 5AZ"
@details['sex'] = "html/body/div[1]/form/input[7]"
@details['interests'] = Hash.new()
@details['interests'][0] = "swimming"
@details['interests'][1] = "walking"
@details['interests'][2] = "cycling"
@details['car'] = Hash.new()
@details['car'][0] = "Volvo"
@details['car'][1] = "Saab"
@details['car'][2] = "Fiat"
@details['car'][3] = "Audi"
end

def set_details_2()
@details = Hash.new()
@details['first-name'] = "Allison"
@details['second-name'] = "Queen"
@details['address'] = Hash.new()
@details['address']['house-number'] = "3"
@details['address']['street'] = "High Street"
@details['address']['city'] = "Plymouth"
@details['address']['postcode'] = "PL4 7LX"
@details['sex'] = "html/body/div[1]/form/input[8]"
@details['interests'] = Hash.new()
@details['interests'][0] = "swimming"
@details['interests'][1] = "walking"
@details['interests'][2] = "cycling"
@details['car'] = Hash.new()
@details['car'][0] = "Volvo"
@details['car'][1] = "Saab"
@details['car'][2] = "Fiat"
@details['car'][3] = "Audi"
end
