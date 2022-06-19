//
//  AttractionsDetailView.swift
//  FBLA WAtour
//
//  Created by Ishita Mundra on 3/19/22.
//
import SwiftUI
import MapKit

// This view gives a more detailed overview for the selected attraction that the user wants to learn more about
struct AttractionsDetailView: View {
    
    // Takes in the attraction passed in by the SuggestAttractions view
    var attraction: Attraction
    @State var userAttributesArr: [String]
    @State var attractionsArr: [Attraction]
    @State var topFive: String
    
    var body: some View {
        
        // Passes the coordinates defined for each attraction object and the attraction's name to the MapView
        // A map is then displayed in this view
        MapView(coordinate: CLLocationCoordinate2D(latitude: attraction.coordinate.latitude, longitude: attraction.coordinate.longitude), name: attraction.name)
        Text(attraction.name)
            .foregroundColor(.primary)
            .font(.title)
            .padding()
        VStack {
            
            // A list of information of the attributes for the specific location is provided
            List {
                HStack {
                    Text("More information")
                        .font(.headline)
                    Image(systemName: "arrow.turn.right.down")
                }
                .padding()
                Label("Location: " + attraction.loc + ", Washington", systemImage: findSymbol(index: 0))
                    .padding()
                    .foregroundColor(findColor(index: 0))
                Label("Type of Location: " + attraction.typeOfLoc, systemImage: findSymbol(index: 1))
                    .padding()
                    .foregroundColor(findColor(index: 1))
                Label("Price: $" + attraction.price, systemImage: findSymbol(index: 2))
                    .padding()
                    .foregroundColor(findColor(index: 2))
                Label("Season: " + attraction.season, systemImage: findSymbol(index: 3))
                    .padding()
                    .foregroundColor(findColor(index: 3))
                Label("Age Group: " + attraction.age, systemImage: findSymbol(index: 4))
                    .padding()
                    .foregroundColor(findColor(index: 4))
            }
        }
        .foregroundColor(Color.black)
        
        // Creates a string to use as a search query
        // This string will be converted to type URL in order to display the booking site
        let attrName = attraction.name.replacingOccurrences(of: " ", with: "%20")
        let urlName = "https://www.google.com/travel/hotels?q=" + attrName
        
        let attrLoc = attraction.loc.replacingOccurrences(of: " ", with: "%20")
        let urlLoc = "https://www.google.com/travel/hotels/" + attrLoc
        let urlState = "https://www.google.com/travel/hotels?q=Washington%20State"
        
        // Locations do not show attraction or city when searched
        // Used search query of state instead
        // Finds hotels in Washington state
        if attraction.loc == "North Cascades" || attraction.loc == "Washtucna" {
            NavigationLink(destination: WebsiteView(urlToDisplay: URL(string: urlState)!)) {
                Text("Look for hotels")
                    .font(.title2)
                    .foregroundColor(Color.black)
                    .bold()
                    .frame(width: 310, height: 30)
                    .padding(20)
                    .background(
                        RoundedRectangle(
                            cornerRadius:30,
                            style: .continuous)
                        .fill(Color.accentColor)
                    )
                }
        }
            
        // Locations do not show attraction when searched
        // Used search query of city instead
        // Finds hotels in the city
        else if (attraction.name == "Riverfront Park" || attraction.name == "University of Washington" || attraction.name == "Franklin Falls" || attraction.name == "Diablo Lake") && verifyUrl(urlString: urlLoc) {
            NavigationLink(destination: WebsiteView(urlToDisplay: URL(string: urlLoc)!)) {
                Text("Book a hotel")
                    .font(.title2)
                    .foregroundColor(Color.white)
                    .bold()
                    .frame(width: 310, height: 30)
                    .padding(20)
                    .background(
                        RoundedRectangle(
                            cornerRadius:30,
                            style: .continuous)
                        .fill(Color.accentColor)
                    )
            }
        }
        
        // Locations show attraction when searched
        // finds hotels near attraction
        else if verifyUrl(urlString: urlName) {
            NavigationLink(destination: WebsiteView(urlToDisplay: URL(string:urlName)!)) {
                    Text("Book a hotel")
                    .font(.title2)
                    .foregroundColor(Color.white)
                    .bold()
                    .frame(width: 310, height: 30)
                    .padding(20)
                    .background(
                        RoundedRectangle(
                            cornerRadius:30,
                            style: .continuous)
                        .fill(Color.accentColor)
                    )
            }
            .padding()
        }
        
        // In case any url of locations does not work, hotels in Washington are displayed
        // This url is proven to work
        else {
            NavigationLink(destination: WebsiteView(urlToDisplay: URL(string: urlState)!)) {
                Text("Book a hotel")
                    .font(.title2)
                    .foregroundColor(Color.white)
                    .bold()
                    .frame(width: 310, height: 30)
                    .padding(20)
                    .background(
                        RoundedRectangle(
                            cornerRadius: 30,
                            style: .continuous)
                        .fill(Color.accentColor)
                    )
            }
        }
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
    
    // This function verifies if the url works by returning a boolean value
    func verifyUrl(urlString: String?) -> Bool {
        if let urlString = urlString {
            if let url = URL(string: urlString) {
                return UIApplication.shared.canOpenURL(url)
            }
        }
        return false
    }
    
    // This function compares which of the 5 attributes are met from user input
    // Returns an array of boolean values, where true means met and false does not
    func compareAttributes() -> [Bool] {
        var doesMatchAttr = [false, false, false, false, false]
        if (attraction.loc == userAttributesArr[0]) || userAttributesArr[0] == "Any Location" {
            doesMatchAttr[0] = true
        }
        if (attraction.typeOfLoc == userAttributesArr[1]) {
            doesMatchAttr[1] = true
        }
        if (Int(attraction.price) ?? 0 <= Int(userAttributesArr[2]) ?? 0) {
            doesMatchAttr[2] = true
        }
        if (attraction.season.contains(userAttributesArr[3])){
            doesMatchAttr[3] = true
        }
        if (attraction.age.contains(userAttributesArr[4])) {
            doesMatchAttr[4] = true
        }
        return doesMatchAttr
    }
    
    // If attribute is met, a string to represent the checkmark symbol is returned
    // If attribute is not met, a string to represent the cross symbol is returned
    func findSymbol(index: Int) -> String {
        let doesMatchAttr = compareAttributes()
        
        if doesMatchAttr[index] {
            return "checkmark.circle.fill"
        } else {
            return "x.circle.fill"
        }
    }
    
    // If attribute is met, a dark green color is returned
    // If attribute is not met, a red color is returned
    func findColor(index: Int) -> Color {
        let doesMatchAttr = compareAttributes()
        
        if doesMatchAttr[index] {
            return Color("DarkGreen")
        }
        else {
            return Color.red
        }
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

struct AttractionsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AttractionsDetailView(attraction: Attraction(name: "", loc: "", typeOfLoc: "", price: "", season: "", age: "", coordinate: CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)), userAttributesArr: [""], attractionsArr: [], topFive: "")
    }
}
