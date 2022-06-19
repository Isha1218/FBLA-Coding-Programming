//
//  SearchAttribute.swift
//  FBLA WAtour
//
//  Created by Ishita Mundra on 4/9/22.
//

import SwiftUI

// This view allows the user to input the first attribute: location
// Unlike the other 4 attributes, it utilizes a search field
struct SearchAttribute: View {
    
    // Changes the appearance of the search field
    init() {
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = .white
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).tintColor = .black
    }
    
    // attribute1 is passed through all 5 attribute views
    // Variable is added to a userAttributes array in SuggestAttractions
    @State var attribute1 = ""
    
    // Will suggest these locations to the user at the start of the search field
    var searchLoc = ["Any Location", "Seattle", "Tacoma", "Olympia", "Snoqualmie", "Bellevue", "Bellingham", "Birch Bay", "Bremerton", "Cascade Mountains", "Chelan County", "Clallam County", "Cougar", "Deming", "Federal Way", "Friday Harbor", "George", "Grand Coulee", "King County", "Maryhill", "Moses Lake", "North Cascades", "Pierce County", "Port Angeles", "Pullman", "San Juan County", "Skagit County", "Skamania County", "Skykomish", "Spokane", "Vancouver", "Washtucna", "Westport"]
    
    // Layout and design
    var body: some View {
        NavigationView {

            ZStack {
                Rectangle()
                    .fill(Color.black.opacity(0.6))
                    .ignoresSafeArea()
                Image("Space Needle")
                    .resizable()
                    .ignoresSafeArea()
                    .opacity(0.7)

                VStack {
                    Spacer()
                    ZStack {
                        
                        VStack {
                            Spacer()
                            
                            // Forces user to search for a location before moving on to the second attribute
                            if attribute1.isEmpty {
                                Text("Search For A Location")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                            }
                            
                            // If user searches a location that is not stored in the database, it will print out a warning
                            // The user can still move on to the second attribute, however
                            else if (!locInDB()) {
                                Text("Warning: \nPlease Select From Dropdown Menu")
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.red)
                                    .multilineTextAlignment(.center)
                            }
                            
                            // If user clicks on "Any Location", "Any location in Washington" is displayed to the user
                            else if attribute1 == "Any Location" {
                                Text("Any location in Washington")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                                    .multilineTextAlignment(.center)
                                    .padding(.trailing, 20)
                                    .padding(.leading, 20)
                            }
                            
                            // If user clicks on a specific location in Washington that is in the database, this location will be displayed to the user
                            else {
                                Text("Location: \n" + attribute1 + ", Washington")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.center)
                                    .padding(.trailing, 20)
                                    .padding(.leading, 20)
                                    .foregroundColor(Color.white)
                            }
                            Spacer()
                            
                            // Unless the user doesn't search for any location, the user will have access to the next page
                            if !attribute1.isEmpty {
                                NavigationLink(destination: Attribute2(attribute1: $attribute1)) {
                                    Text("Next")
                                        .font(.title2)
                                        .foregroundColor(Color.black)
                                        .bold()
                                        .frame(width: 310, height: 30)
                                        .padding(20)
                                        .background(
                                            RoundedRectangle(
                                                cornerRadius:30,
                                                style: .continuous)
                                            .fill(Color.white)
                                        )

                                }
                                .padding(20)
                            }
                            NavigationLink(destination: HomeScreen().hiddenNavigationBarStyle()) {
                                Image(systemName: "house.fill")
                                    .foregroundColor(Color.white)
                                    .font(.title)
                            }
                            

                        }

                        VStack {
                            
                            // Provides a list of all locations in the database
                            List {
                                ForEach(searchResults, id: \.self) { name in
                                    NavigationLink(destination: Text(name)) {
                                        Text(name)
                                    }
                                }
                            }
                            .opacity(0)
                        
                            // Displays the search bar to the user
                            // The most popular locations (Seattle, Tacoma, Snoqualmie, and Olympia) will have a star next to them
                            // A star is also placed next to Any Location
                            // The star is useful for individuals that have never been to Washington before
                            .searchable(text: $attribute1, placement: .navigationBarDrawer, prompt: "Search for a location here...", suggestions: {
                                ForEach(searchResults, id: \.self) { result in
                                    if result == "Any Location" {
                                        Label(result, systemImage: "star.fill").searchCompletion(result)
                                    }
                                    if result == "Seattle" || result == "Tacoma" || result == "Snoqualmie" || result == "Olympia" {
                                        Label(result + ", Washington", systemImage: "star.fill").searchCompletion(result)
                                    } else {
                                        if result != "Any Location" {
                                            Text(result + ", Washington").searchCompletion(result)
                                        }
                                    }
                                }
                                .padding(15)
                            })
                            .navigationBarTitle("1: Location")
                            
                        }
                    
                    }
                
                }
            }
        }
    }
    
    // Filters the available locations to search based on what the user has already searched for
    var searchResults: [String] {
        if attribute1.isEmpty {
            return searchLoc
        } else {
            return searchLoc.filter({ $0.contains(attribute1)})
        }
    }
    
    // Returns a boolean value to indicate whether or not the location that the user has searched for is in the database
    func locInDB() -> Bool {
        for loc in searchLoc {
            if (loc == attribute1) {
                return true
            }
        }
        return false
    }
}

struct SearchAttrbiute_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

