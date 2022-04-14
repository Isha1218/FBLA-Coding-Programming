//
//  SuggestAttractions.swift
//  WaTourIshitaM
//
//  Created by Ishita Mundra on 12/31/21.
//
import SwiftUI
import MapKit


// IMPORTANT: set price as a range - also display this range to the user since it often varies for different people

// This view displays the top five locations based on the five user attributes
struct SuggestAttractions: View {
    
    // All five user attribute variables are passed into this view
    @Binding var attribute1: String
    @Binding var attribute2: String
    @Binding var attribute3: String
    @Binding var attribute4: String
    @Binding var attribute5: String
    
    var body: some View {
        
        // Array of 50 tourist objects
        // Each tourist object has a name, location, type of location, price, season, age group, and coordinate.
        let touristAttractionsArr = [
            Attraction(name: "Space Needle", loc: "Seattle", typeOfLoc: "Landmark", price: "30", season: "Winter, Spring, Summer, Fall", age: "Kids, Adults", coordinate: CLLocationCoordinate2D(latitude: 47.6205, longitude: -122.349277)),
            Attraction(name: "Wild Waves", loc: "Federal Way", typeOfLoc: "Theme Park", price: "40", season: "Spring, Summer", age: "Kids", coordinate: CLLocationCoordinate2D(latitude: 47.273400383444006, longitude: -122.31274537742554)),
            Attraction(name: "Mount Ranier", loc: "Tacoma", typeOfLoc: "Nature", price: "20", season: "Summer", age: "Kids, Adults", coordinate: CLLocationCoordinate2D(latitude: 46.8537143424195, longitude: -121.76118136944118)),
            Attraction(name: "The Seattle Great Wheel", loc: "Seattle", typeOfLoc: "Theme Park", price: "10", season: "Winter, Spring, Summer, Fall", age: "Kids, Adults, Seniors", coordinate: CLLocationCoordinate2D(latitude: 47.606091, longitude: -122.342430)),
            Attraction(name: "Olympic National Park", loc: "Port Angeles", typeOfLoc: "Nature", price: "20", season: "Summer", age: "Kids, Adults", coordinate: CLLocationCoordinate2D(latitude: 47.84713317521236, longitude: -123.61563332327592)),
            Attraction(name: "Leavenworth", loc: "Cascade Mountains", typeOfLoc: "Culture", price: "101", season: "Spring", age: "Adults", coordinate: CLLocationCoordinate2D(latitude: 47.59799422007123, longitude: -120.66159845949579)),
            Attraction(name: "Mount Saint Helens", loc: "Skamania County", typeOfLoc: "Nature", price: "10", season: "Summer, Fall", age: "Kids, Adults", coordinate: CLLocationCoordinate2D(latitude: 46.19335941411949, longitude: -122.19563679503446)),
            Attraction(name: "Skagit Valley Tulip Festival", loc: "Skagit County", typeOfLoc: "Nature", price: "20", season: "Spring, Summer", age: "Kids, Adults, Seniors", coordinate: CLLocationCoordinate2D(latitude: 48.49256911064861, longitude: -122.24752741138624)),
            Attraction(name: "Museum of Glass", loc: "Tacoma", typeOfLoc: "Art", price: "30", season: "Winter, Spring, Summer, Fall", age: "Adults, Seniors", coordinate: CLLocationCoordinate2D(latitude: 47.24561002935785, longitude: -122.43408337557561)),
            Attraction(name: "Washington State Capitol Building", loc: "Olympia", typeOfLoc: "Historical", price: "0", season: "Winter, Spring, Summer, Fall", age: "Kids, Seniors", coordinate: CLLocationCoordinate2D(latitude: 47.0360957334523, longitude: -122.90442374489757)),
            Attraction(name: "Museum of Pop Culture", loc: "Seattle", typeOfLoc: "Art", price: "30", season: "Winter, Spring, Summer, Fall", age: "Kids, Adults, Seniors", coordinate: CLLocationCoordinate2D(latitude: 47.62160531458876, longitude: -122.34809231603678)),
            Attraction(name: "San Juan Islands", loc: "Friday Harbor", typeOfLoc: "Nature", price: "101", season: "Summer", age: "Kids, Adults", coordinate: CLLocationCoordinate2D(latitude: 48.636918606664295, longitude: -123.0050115161143)),
            Attraction(name: "Diablo Lake", loc: "North Cascades", typeOfLoc: "Nature", price: "0", season: "Spring, Summer", age: "Kids, Adults", coordinate: CLLocationCoordinate2D(latitude: 48.81368470304164, longitude: -121.28044950908505)),
            Attraction(name: "North Cascades National Park", loc: "North Cascades", typeOfLoc: "Nature", price: "0", season: "Spring, Summer", age: "Kids, Adults", coordinate: CLLocationCoordinate2D(latitude: 48.7718, longitude: 121.2985)),
            Attraction(name: "Tacoma Art Museum", loc: "Tacoma", typeOfLoc: "Art", price: "20", season: "Winter, Spring, Summer, Fall", age: "Adults, Seniors", coordinate: CLLocationCoordinate2D(latitude: 47.2475599070071, longitude: -122.43685614673976)),
            Attraction(name: "Bellevue Botanical Garden", loc: "Bellevue", typeOfLoc: "Nature", price: "0", season: "Spring, Summer", age: "Adults, Seniors", coordinate: CLLocationCoordinate2D(latitude: 47.61940744789819, longitude: -122.18176594906065)),
            Attraction(name: "Snoqualmie Falls", loc: "Snoqualmie", typeOfLoc: "Nature", price: "0", season: "Spring, Summer", age: "Kids, Adults, Seniors", coordinate: CLLocationCoordinate2D(latitude: 47.5418728953225, longitude: -121.8378436657728)),
            Attraction(name: "Northwest Railway Museum", loc: "Snoqualmie", typeOfLoc: "Historical", price: "20", season: "Winter, Spring, Summer, Fall", age: "Kids, Adults, Seniors", coordinate: CLLocationCoordinate2D(latitude: 47.529995001959456, longitude: -121.82690582491334)),
            Attraction(name: "Seattle Aquarium", loc: "Seattle", typeOfLoc: "Nature", price: "30", season: "Winter, Spring, Summer, Fall", age: "Kids", coordinate: CLLocationCoordinate2D(latitude: 47.60754484801229, longitude: -122.34293434487334)),
            Attraction(name: "Pike Place Market", loc: "Seattle", typeOfLoc: "Culture", price: "10", season: "Winter, Spring, Summer, Fall", age: "Adults, Seniors", coordinate: CLLocationCoordinate2D(latitude: 47.60851981196058, longitude: -122.3402309141863)),
            Attraction(name: "Gum Wall", loc: "Seattle", typeOfLoc: "Landmark", price: "20", season: "Summer", age: "Kids", coordinate: CLLocationCoordinate2D(latitude: 47.6084, longitude: 122.3403)),
            Attraction(name: "The Museum of Flight", loc: "Seattle", typeOfLoc: "Historical", price: "20", season: "Winter, Spring, Summer, Fall", age: "Kids, Adults, Seniors", coordinate: CLLocationCoordinate2D(latitude: 47.51864656501488, longitude: -122.29683304486451)),
            Attraction(name: "Chihuly Garden and Glass", loc: "Seattle", typeOfLoc: "Nature", price: "30", season: "Spring, Summer", age: "Kids, Adults, Seniors", coordinate: CLLocationCoordinate2D(latitude: 47.620682816757956, longitude: -122.35052270439553)),
            Attraction(name: "Woodland Park Zoo", loc: "Seattle", typeOfLoc: "Nature", price: "20", season: "Spring, Summer", age: "Kids", coordinate: CLLocationCoordinate2D(latitude: 47.668796028425675, longitude: -122.3508540178859)),
            Attraction(name: "Pioneer Square", loc: "Seattle", typeOfLoc: "Culture", price: "0", season: "Spring, Summer, Fall", age: "Adults", coordinate: CLLocationCoordinate2D(latitude: 47.60204108199866, longitude: -122.3342899103067)),
            Attraction(name: "Lake Chelan", loc: "Chelan County", typeOfLoc: "Nature", price: "20", season: "Spring, Summer", age: "Kids, Adults", coordinate: CLLocationCoordinate2D(latitude: 48.04525970467827, longitude: -120.34008813394001)),
            Attraction(name: "Riverfront Park", loc: "Spokane", typeOfLoc: "Nature", price: "10", season: "Spring, Summer", age: "Kids, Adults, Seniors", coordinate: CLLocationCoordinate2D(latitude: 47.66223710024201, longitude: -117.4191175737068)),
            Attraction(name: "Cape Flattery", loc: "Clallam County", typeOfLoc: "Nature", price: "10", season: "Spring, Summer", age: "Kids, Adults", coordinate: CLLocationCoordinate2D(latitude: 48.38476910893583, longitude: -124.71389607425492)),
            Attraction(name: "Palouse Falls State Park", loc: "Washtucna", typeOfLoc: "Nature", price: "10", season: "Spring, Summer", age: "Kids, Adults, Seniors", coordinate: CLLocationCoordinate2D(latitude: 46.66506779461951, longitude: -118.224092047203)),
            Attraction(name: "Birch Bay Water Slides", loc: "Birch Bay", typeOfLoc: "Theme Park", price: "20", season: "Spring, Summer", age: "Kids", coordinate: CLLocationCoordinate2D(latitude: 48.9369945137679, longitude: -122.74744990083266)),
            Attraction(name: "Surf'n Slide Water Park", loc: "Moses Lake", typeOfLoc: "Theme Park", price: "101", season: "Spring, Summer", age: "Kids", coordinate: CLLocationCoordinate2D(latitude: 47.12660267112169, longitude: -119.28022476023715)),
            Attraction(name: "John S. McMillin Memorial Mausoleum", loc: "San Juan County", typeOfLoc: "Landmark", price: "0", season: "Winter, Spring, Summer, Fall", age: "Adults, Seniors", coordinate: CLLocationCoordinate2D(latitude: 48.61607585059462, longitude: -123.14897071599405)),
            Attraction(name: "Chihuly Bridge of Glass", loc: "Tacoma", typeOfLoc: "Landmark", price: "0", season: "Winter, Spring, Summer, Fall", age: "Adults, Seniors", coordinate: CLLocationCoordinate2D(latitude: 47.24588487874293, longitude: -122.43445868536585)),
            Attraction(name: "Grand Coulee Dam", loc: "Grand Coulee", typeOfLoc: "Landmark", price: "0", season: "Spring, Summer", age: "Adults", coordinate: CLLocationCoordinate2D(latitude: 47.95671813468251, longitude: -118.98109219088875)),
            Attraction(name: "University of Washington", loc: "Seattle", typeOfLoc: "Landmark", price: "0", season: "Winter, Spring, Summer, Fall", age: "Kids, Adults", coordinate: CLLocationCoordinate2D(latitude: 47.6696011438278, longitude: -122.30113248472146)),
            Attraction(name: "Lava Canyon Suspension Bridge", loc: "Cougar", typeOfLoc: "Landmark", price: "10", season: "Spring, Summer", age: "Kids, Adults", coordinate: CLLocationCoordinate2D(latitude: 46.1693375197836, longitude: -122.08322219096425)),
            Attraction(name: "Fairhaven Historic District", loc: "Bellingham", typeOfLoc: "Historical", price: "0", season: "Spring, Summer, Fall", age: "Adults, Seniors", coordinate: CLLocationCoordinate2D(latitude: 48.7189945825312, longitude: -122.50707760297618)),
            Attraction(name: "Fort Vancouver", loc: "Vancouver", typeOfLoc: "Historical", price: "10", season: "Winter, Spring, Summer, Fall", age: "Kids, Adults, Seniors", coordinate: CLLocationCoordinate2D(latitude: 45.62629651879445, longitude: -122.65666244680726)),
            Attraction(name: "Stevens Pass", loc: "Skykomish", typeOfLoc: "Ski", price: "100", season: "Winter", age: "Kids, Adults", coordinate: CLLocationCoordinate2D(latitude: 47.74742504095484, longitude: -121.08969986894772)),
            Attraction(name: "Mount Baker Ski Area", loc: "Deming", typeOfLoc: "Ski", price: "10", season: "Winter", age: "Kids, Adults", coordinate: CLLocationCoordinate2D(latitude: 48.858285048274155, longitude: -121.66752745491752)),
            Attraction(name: "Gorge Amphitheatre", loc: "George", typeOfLoc: "Landmark", price: "101", season: "Winter, Spring, Summer, Fall", age: "Kids, Adults, Seniors", coordinate: CLLocationCoordinate2D(latitude: 47.101843051748695, longitude: -119.99557348415303)),
            Attraction(name: "Grays Harbor Lighthouse", loc: "Westport", typeOfLoc: "Landmark", price: "10", season: "Spring, Summer", age: "Kids, Adults, Seniors", coordinate: CLLocationCoordinate2D(latitude: 46.88832189643296, longitude: -124.11687961606789)),
            Attraction(name: "Washington State University", loc: "Pullman", typeOfLoc: "Landmark", price: "0", season: "Winter, Spring, Summer, Fall", age: "Kids, Adults", coordinate: CLLocationCoordinate2D(latitude: 46.73211175512409, longitude: -117.1542727081565)),
            Attraction(name: "Sky View Observatory", loc: "Seattle", typeOfLoc: "Landmark", price: "10", season: "Winter, Spring, Summer, Fall", age: "Kids, Adults, Seniors", coordinate: CLLocationCoordinate2D(latitude: 47.60445068552854, longitude: -122.33113984857559)),
            Attraction(name: "Lumen Field", loc: "Seattle", typeOfLoc: "Landmark", price: "20", season: "Winter, Spring, Summer, Fall", age: "Kids, Adults", coordinate: CLLocationCoordinate2D(latitude: 47.59529648188593, longitude: -122.33158575836623)),
            Attraction(name: "Tacoma Narrows Bridge", loc: "Pierce County", typeOfLoc: "Landmark", price: "10", season: "Winter, Spring, Summer, Fall", age: "Adults, Seniors", coordinate: CLLocationCoordinate2D(latitude: 47.26907992068161, longitude: -122.55164597372357)),
            Attraction(name: "Franklin Falls", loc: "King County", typeOfLoc: "Nature", price: "10", season: "Spring, Summer", age: "Kids, Adults", coordinate: CLLocationCoordinate2D(latitude: 47.42629231635013, longitude: -121.43299308376342)),
            Attraction(name: "Harborside Fountain Park", loc: "Bremerton", typeOfLoc: "Nature", price: "0", season: "Spring, Summer", age: "Kids, Adults, Seniors", coordinate: CLLocationCoordinate2D(latitude: 47.56220821172171, longitude: -122.62580151603935)),
            Attraction(name: "Stonehenge Memorial", loc: "Maryhill", typeOfLoc: "Landmark", price: "0", season: "Spring, Summer", age: "Kids, Adults", coordinate: CLLocationCoordinate2D(latitude: 45.69512288583619, longitude: -120.80603806390806)),
            Attraction(name: "Washington State History Museum", loc: "Tacoma", typeOfLoc: "Historical", price: "20", season: "Winter, Spring, Summer, Fall", age: "Kids, Adults, Seniors", coordinate: CLLocationCoordinate2D(latitude: 47.24480153021374, longitude: -122.43605056208324))
        ]
        
        // The 5 attributes from user input are all combined into one array
        let userAttributesArr = [attribute1, attribute2, attribute3, attribute4, attribute5]
        
        // numAttributes is a dictionary
        // The values of this dictionary represent the number of attributes that each tourist location in touristAttractionsArr meet
        // The keys of this dictionary represent the index of the each tourist attraction in touristAttractionsArr
        let numAttributes = countAttributes(arr: touristAttractionsArr, userAttributes: userAttributesArr)
        
        // The numAttributes disctionary is sorted by values from greatest to least and assigned to the variable sortedDict
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
                NavigationLink(destination: AttractionsDetailView(attraction: firstAtt)) {
                    AttractionRowView(first, description: "Meets " + String(firstCount) + "/5 attributes", titleIcon: first + " Circle", count: 1)
                }
                NavigationLink(destination: AttractionsDetailView(attraction: secondAtt)) {
                    AttractionRowView(second, description: "Meets " + String(secondCount) + "/5 attributes", titleIcon: second + " Circle", count: 2)
                }
                NavigationLink(destination: AttractionsDetailView(attraction: thirdAtt)) {
                    AttractionRowView(third, description: "Meets " + String(thirdCount) + "/5 attributes", titleIcon: third + " Circle", count: 3)
                }
                NavigationLink(destination: AttractionsDetailView(attraction: fourthAtt)) {
                    AttractionRowView(fourth, description: "Meets " + String(fourthCount) + "/5 attributes", titleIcon: fourth + " Circle", count: 4)
                }
                NavigationLink(destination: AttractionsDetailView(attraction: fifthAtt)) {
                    AttractionRowView(fifth, description: "Meets " + String(fifthCount) + "/5 attributes", titleIcon: fifth + " Circle", count: 5)
                }
            }
            
            // Provides the user an option to return home, through a button
            NavigationLink(destination: HomeScreen().hiddenNavigationBarStyle()) {
                    Text("Return Home")
                        .font(.title2)
                        .foregroundColor(Color.white)
                        .bold()
                        .frame(width: 310, height: 30)
                        .padding(20)
                        .background(
                            RoundedRectangle(
                                cornerRadius:30,
                                style: .continuous)
                            .fill(Color.black)
                        )
                    
                }
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
            
            if (userAttributes[0] == arr[row].loc) {
                count+=1
            
            // The other option is only located for the location attribute
            // If other is selected by the user and the tourist attraction is not located in the areas that the user can select from, then that tourist location meets this attribute.
            } else if userAttributes[0] == "Other" {
                if arr[row].loc != "Seattle" && arr[row].loc != "Tacoma" && arr[row].loc != "Bellevue" && arr[row].loc != "Olympia" && arr[row].loc != "Friday Harbor" {
                    count += 1
                }
            }
            if arr[row].typeOfLoc.contains(userAttributes[1]) {
                count+=1
            }
            if userAttributes[2] == arr[row].price {
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

}

// Descirbes the layout of display of the top five attractions
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
