//
//  SuggestAttractions.swift
//  FBLA WAtour
//
//  Created by Ishita Mundra on 12/31/21.
//
import SwiftUI
import MapKit
import WebKit

// This view displays the top five locations based on the five user attributes
struct SuggestAttractions: View {
    
    // All five user attribute variables are passed into this view
    @Binding var attribute1: String
    @Binding var attribute2: String
    @Binding var attribute3: String
    @Binding var attribute4: String
    @Binding var attribute5: String
    
    @State var isActive = false

    // Loads csv file from filename: "tourist.csv"
    var csv = CSVLoadable(file: "tourist.csv")
    @State var touristAttractionsArr: [Attraction]
    
    // Overrides original init() function to define variables
    init(attribute1: Binding<String>, attribute2: Binding<String>, attribute3: Binding<String>,
         attribute4: Binding<String>, attribute5: Binding<String>) {
        self._attribute1 = attribute1
        self._attribute2 = attribute2
        self._attribute3 = attribute3
        self._attribute4 = attribute4
        self._attribute5 = attribute5
        
        // Creates array of 50 tourist objects
        // Each tourist object has a name, location, type of location, price, season, age group, and coordinate.
        csv.loadFile()
        self.touristAttractionsArr = csv.createArr()
    }
    
    
    var body: some View {
        
        // The 5 attributes from user input are all combined into one array
        let userAttributesArr = [self.attribute1, self.attribute2, self.attribute3, self.attribute4, self.attribute5]
        
        // numAttributes is a dictionary
        // The values of this dictionary represent the number of attributes that each tourist location in touristAttractionsArr meet
        // The keys of this dictionary represent the index of the each tourist attraction in touristAttractionsArr
        let numAttributes = countAttributes(arr: touristAttractionsArr, userAttributes: userAttributesArr)
        
        // The numAttributes dictionary is sorted by values from greatest to least and assigned to the variable sortedDict
        let sortedDict = numAttributes.sorted(by: { $0.value > $1.value })

        VStack {
            
            // Keeps track of the top five tourist attraction names
            let first = touristAttractionsArr[sortedDict[0].key].name
            let second = touristAttractionsArr[sortedDict[1].key].name
            let third = touristAttractionsArr[sortedDict[2].key].name
            let fourth = touristAttractionsArr[sortedDict[3].key].name
            let fifth = touristAttractionsArr[sortedDict[4].key].name
            
            // Keeps track of the top five tourist locations
            let firstAtt = touristAttractionsArr[sortedDict[0].key]
            let secondAtt = touristAttractionsArr[sortedDict[1].key]
            let thirdAtt = touristAttractionsArr[sortedDict[2].key]
            let fourthAtt = touristAttractionsArr[sortedDict[3].key]
            let fifthAtt = touristAttractionsArr[sortedDict[4].key]
            
            // Keeps track of the attributes that each tourist location in the top five meet
            let firstCount = sortedDict[0].value
            let secondCount = sortedDict[1].value
            let thirdCount = sortedDict[2].value
            let fourthCount = sortedDict[3].value
            let fifthCount = sortedDict[4].value
            
            let topFive = "\n\nRecommended Attractions: " + "1. " + first + ", 2. " + second + ", 3. " + third + ", 4. " + fourth + ", 5. " + fifth
            
            Text("Top Five Attractions")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            // Displays top five tourist location
            // Numbers each location (greatest is 1 and so on...)
            // Names each tourist location and provides and image
            // Details how many attributes tourist location meets
            List {
                
                // User is able to explore more about the location by clicking on an arrow near the side of the each location
                // The attraction object is passed to the AttractionsDetailView to present more information about that location
                // Information about each attribute is displayed
                // A map of where the attraction is located is also displayed
                NavigationLink(destination: AttractionsDetailView(attraction: firstAtt, userAttributesArr: userAttributesArr, attractionsArr: touristAttractionsArr, topFive: topFive)) {
                    AttractionRowView(first, description: "Meets " + String(firstCount) + "/5 attributes", titleIcon: first + " Circle", count: 1)
                }
                NavigationLink(destination: AttractionsDetailView(attraction: secondAtt, userAttributesArr: userAttributesArr, attractionsArr: touristAttractionsArr, topFive: topFive)) {
                    AttractionRowView(second, description: "Meets " + String(secondCount) + "/5 attributes", titleIcon: second + " Circle", count: 2)
                }
                NavigationLink(destination: AttractionsDetailView(attraction: thirdAtt, userAttributesArr: userAttributesArr, attractionsArr: touristAttractionsArr, topFive: topFive)) {
                    AttractionRowView(third, description: "Meets " + String(thirdCount) + "/5 attributes", titleIcon: third + " Circle", count: 3)
                }
                NavigationLink(destination: AttractionsDetailView(attraction: fourthAtt, userAttributesArr: userAttributesArr, attractionsArr: touristAttractionsArr, topFive: topFive)) {
                    AttractionRowView(fourth, description: "Meets " + String(fourthCount) + "/5 attributes", titleIcon: fourth + " Circle", count: 4)
                }
                NavigationLink(destination: AttractionsDetailView(attraction: fifthAtt, userAttributesArr: userAttributesArr, attractionsArr: touristAttractionsArr, topFive: topFive)) {
                    AttractionRowView(fifth, description: "Meets " + String(fifthCount) + "/5 attributes", titleIcon: fifth + " Circle", count: 5)
                }
            }
            
            // Provides the user an option to return home, through a button
            // Does a backup by storing the data within the phone
            NavigationLink(destination: HomeScreen().hiddenNavigationBarStyle()) {
                Image(systemName: "house.fill")
                    .foregroundColor(Color.black)
                    .font(.title)
            }.simultaneousGesture (TapGesture().onEnded {
                // When home button is tapped, the program writes the user attributes to a text file
                
                // Makes the contents inside the file more readable
                var contents = "Inputted Attributes: " + userAttributesArr.joined(separator: ", ")
                contents = contents + topFive
                
                // Allows the user to upload/send the file to a location
                writeFile(contents: contents)
            })
                    
        }
        
    }
    
    // This function compares the userAttributes array and touristAttractions array
    // The number of attributes that each location meets is represented through count
    // This is represented through the numAttributes dictionary, which is returned by this function
    func countAttributes(arr: [Attraction], userAttributes: [String]) -> [Int: Int] {
        var numAttributes: [Int: Int] = ([:])
        
        // Loops through all 50 tourist attractions
        for row in 0...arr.count - 1 {
            var count = 0
            
            if (arr[row].loc.contains(userAttributes[0])) || userAttributes[0] == "Any Location" {
                count+=1
            }
            if arr[row].typeOfLoc.contains(userAttributes[1]) {
                count+=1
            }
            if Int(arr[row].price) ?? 0 <= Int(userAttributes[2]) ?? 0 {
                count+=1
            }
            if arr[row].season.contains(userAttributes[3]) {
                count += 1
            }
            if arr[row].age.contains(userAttributes[4]) {
                count += 1
            }
            
            // Value is assigned
            numAttributes[row] = count
            
        }
        
        return numAttributes
    }
    
    // Allows the user to upload or send the file to another location
    func writeFile(contents: String) -> Void{
        
        // Uses the date as a string for the filename
        let year = String(Calendar.current.component(.year, from: Date()))
        let month = String(Calendar.current.component(.month, from: Date()))
        let day = String(Calendar.current.component(.day, from: Date()))
        let date = month + ":" + day + ":" + year
        
        let file = "data_" + date + ".txt"
        
        // Uses try and catch to find any errors will uploading or sending the file
        let dir = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(file)
        do {
           try contents.write(to: dir!, atomically: true, encoding: .utf8)
        } catch {
           print(error.localizedDescription)
        }
        var filesToShare = [Any]()
        filesToShare.append(dir!)
        let av = UIActivityViewController(activityItems: filesToShare, applicationActivities: nil)
        
        // Presents a view for uploading/sending the file to the user
        UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
    }

}

// Describes the layout of display of the top five attractions
struct AttractionRowView: View {
  var title: String
  var description: String?
  var titleIcon: String
  var count: Int
    
    init(_ title: String, description: String? = nil, titleIcon: String, count: Int = 1) {
        self.title = title
        self.description = description
        self.titleIcon = titleIcon
        self.count = count
  }
  
  var body: some View {
    HStack {
        Text("\(count)")
          .font(.title)
      VStack(alignment: .leading) {
        Text(title)
          .font(.headline)
        if let description = description {
          Text(description)
            .font(.subheadline)
        }
      }
      Spacer()
        Image(titleIcon)
            .shadow(radius: 5)
            .overlay(Circle().stroke(Color.black, lineWidth: 2))
    }
  }
}

// Loads the csv file of tourist attractions
// This data will then be used to create an array of tourist attraction objects
struct CSVLoadable {
    var file: String
    var text: String = ""
    
    
    mutating func loadFile() {
        
        if let filepath = Bundle.main.path(forResource: "tourist", ofType: "csv") {
            do {
                let contents = try String(contentsOfFile: filepath)
                self.text = contents
            } catch {
                print("Invalid filepath")
            }
        } else {
            print("File not found")
        }
        
    }
    
    // Creates a 50 Attraction array using the csv file
    func createArr() -> [Attraction] {
        
        let textArr = self.text.components(separatedBy: "\\n")
        var arr: [Attraction] = []
        
        var count = 0
        for val in textArr {
            if (count == 0){
                count += 1
                continue
            }
            
            let startArr = val.components(separatedBy: ",")
            arr.append(findAttr(finArr: lookLine(startArr: startArr)))

        }
        
        return arr
    }
    
    
    // Rewrites the csv array for special cases that include quotes (multiple values)
    func lookLine(startArr: [String]) -> [String] {
        var finArr: [String] = []
        
        
        // startQuote is equal to true when element starts with quote and is false when quote ends
        var startQuote = false
        var quoteBeg = ""
        
        for element in startArr{
            if(startQuote == true) {
                // Quote has ended
                if(element.suffix(1) == "\"") {
                    
                    // Removes the quote at the end here
                    quoteBeg += element.prefix(element.count - 1)
                    finArr.append(quoteBeg)
                    
                    // Resets
                    startQuote = false
                    quoteBeg = ""
                }
                else {
                    quoteBeg += element + ","
                }
            }
            
            // Starts with quote
            else if(element.prefix(1) == "\"") {
                // Remove the quote at the beginning
                quoteBeg += element.suffix(element.count - 1) + ","
                startQuote = true
            }
            // If there is no quote range (e.g. location, price)
            else {
                finArr.append(element)
            }
        }
        
        return finArr
    }
    
    // Combines each of the properties identified by the csv file and creates an attraction object
    func findAttr(finArr: [String]) -> Attraction {
        let trimmed = finArr[0].replacingOccurrences(of: "^\\s*", with: "", options: .regularExpression)
        
        return Attraction(name: trimmed, loc: finArr[1], typeOfLoc: finArr[2], price: finArr[3], season: finArr[4], age: finArr[5], coordinate: CLLocationCoordinate2D(latitude: Double(finArr[6]) ?? 0.0, longitude: Double(finArr[7]) ?? 0.0))
    }
    
    
}

// Defines the Attraction object using name, location, type of location, price, season, age group, and coordinate
struct Attraction: Identifiable {
    let id = UUID()
    var name: String
    var loc: String
    var typeOfLoc: String
    var price: String
    var season: String
    var age: String
    
    var coordinate: CLLocationCoordinate2D
}

struct SuggestAttributes_Previews: PreviewProvider {
    static var previews: some View {
        SuggestAttractions(attribute1: .constant(""), attribute2: .constant(""), attribute3: .constant(""), attribute4: .constant(""), attribute5: .constant(""))
        
    }
}

