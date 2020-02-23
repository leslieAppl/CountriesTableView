# Countries Table View
### From Udemy
### By Alexander Adelmaer

## All about Table View

- v0.1.0 Create multi-section table
- v0.1.0 Setup TableView Section Header Text Floating on the Screen
- v0.1.1 added sectionIndexTitles()

## Problems
- v0.1.0 problem: Don't know how to delete alocated element in the multi-section table veiw.
- v0.1.2 resolved: Delete multi-section element.

- v0.1.2 problem: How to count multi-section element( a dictionary array)

## Implement countryDictionary array
    var countriesList: [(name: String, population: Int)] = [("Afghanistan",37209007),("Albania",2938428),("Algeria",42679018),("Andorra",77072),("Angola",31787566)...]
    
    var countryDictionary = [String: [(name: String, population: Int)]]()
        // z: [("Zambia",18137369),("Zimbabwe",17297495)]

    var sectionTitles = [String]()  // A, B, C, D, E..

    func createExtendedTableViewData() {
    
        // reset dictionary
        countryDictionary = [String: [(name: String, population: Int)]]()
    
        for country in countriesList {
        
            let countryKey = String(country.name.prefix(1)) // USA > U
        
            // countryValue is an array witch is the value of the dictionary key of array
            if var countryValue = countryDictionary[countryKey] {
            
                // if 'countryDictionary[key]' has values of array, append the new element to the array with the same dictionary key.
                countryValue.append(country)
                countryDictionary[countryKey] = countryValue
                print("if true: \(countryDictionary[countryKey])\n")
            } else {
                // if 'countryDictionary[key]' is nil, then append first 'country tuple' under the dictionary key array.
                countryDictionary[countryKey] = [country]
                print("if else: \(countryDictionary[countryKey])\n")
            }
        
        }
    
    //    print(countryDictionary)
        
        sectionTitles = [String](countryDictionary.keys)
        sectionTitles = sectionTitles.sorted(by: <) // A.. Z
        print("\(sectionTitles)\n")
    }


