//
//  HomeScreen.swift
//  FBLA WAtour
//
//  Created by Ishita Mundra on 4/9/22.
//

import SwiftUI

// First page of app
// Provides access to 3 pages:
// Search for tourist locations
// Featured location
// More information about tourist locations in Washington
struct HomeScreen: View {
    var body: some View {
        NavigationView {
            
            // Design for first view -> search for tourist locations
            // Provides user access to an information page about the algorithm
            // Layout is formatted in the shape of a box
            ZStack {
                ScrollView {
                    Text("WAtour")
                        .font(Font.custom("Montserrat-Bold", size: 40))
                        .fontWeight(.bold)
                        .foregroundColor(.accentColor)
                    Group {
                        
                        // Design for first view -> search location
                        // Provides user access to the actual program
                        // Layout is formatted in the shape of a box
                        NavigationLink(destination: AttributeInformation().hiddenNavigationBarStyle()) {
                            Text("Search For Tourist Locations")
                                .font(.title2)
                                .foregroundColor(Color.white)
                                .bold()
                                .frame(width: 310, height: 200)
                                .padding(20)
                                .background(
                                    Image("Google Maps")
                                        .resizable()
                                        .opacity(0.9)
                                        .overlay(SearchOverlay(), alignment: .topLeading)
                                    )
                                .shadow(color: Color.black, radius: 10, x: -10, y: 10)
                                .cornerRadius(20)
                        }
                    }
                    
                    // Design for second view -> featured location
                    // Location fatured is Diablo Lake
                    // Layout is formatted in the shape of a box
                    Group {
                        Button (
                            action: {
                                
                                // Allows user to access link to learn more about Diablo Lake
                                if let url = URL(string: "https://www.wta.org/go-hiking/hikes/diablo-lake") {
                                    UIApplication.shared.open(url)
                                }
                            }, label: {
                                Text("Diablo Lake")
                                    .font(.title2)
                                    .foregroundColor(Color.white)
                                    .bold()
                                    .frame(width: 310, height: 200)
                                    .padding(20)
                                    .background(
                                        Image("Diablo Lake")
                                            .resizable()
                                            .opacity(0.9)
                                            .overlay(FeaturedLocationOverlay(), alignment: .topLeading)
                                        )
                                    .shadow(color: Color.black, radius: 10, x: -10, y: 10)
                                    .cornerRadius(20)
                            }
                        )
                    }
                    
                    // Design for third view -> more information about tourist locations in Washington
                    // Provides user an article about locations in Washington
                    // Layout is formatted in the shape of a box
                    Group {
                        Button (
                            action: {
                                if let url = URL(string: "https://www.stateofwatourism.com/") {
                                    UIApplication.shared.open(url)
                                }
                            }, label: {
                                Text("Learn More About Washington State")
                                    .font(.title2)
                                    .foregroundColor(Color.white)
                                    .bold()
                                    .frame(width: 310, height: 200)
                                    .padding(20)
                                    .background(
                                        Image("Seattle Skyline")
                                            .resizable()
                                            .opacity(0.9)
                                            .overlay(ArticleOverlay(), alignment: .topLeading)
                                        )
                                    .shadow(color: Color.black, radius: 10, x: -10, y: 10)
                                    .cornerRadius(20)
                            }
                        )
                
                    }
                }
            }
        }
    }
}

// Creates a banner for the box with more info on Washington
struct ArticleOverlay: View {
    var body: some View {
        ZStack {
            Text("Washington Info")
                .font(.body)
                .padding(10)
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
                .background(Color.accentColor)
        }.background(Color.accentColor)
        .cornerRadius(10.0)
    }
}

// Creates a banner over the search attraction program
struct SearchOverlay: View {
    var body: some View {
        ZStack {
            Text("Search Location")
                .font(.body)
                .padding(10)
                .foregroundColor(.white)
        }.background(Color.accentColor)
        .cornerRadius(10.0)
    }
}

// Creates a banner for the featured location view
struct FeaturedLocationOverlay: View {
    var body: some View {
        ZStack {
            Text("Featured Location")
                .font(.body)
                .padding(10)
                .foregroundColor(.white)
        }.background(Color.accentColor)
        .cornerRadius(10.0)
    }
}

// Hides the default back button associated with Navigation View
struct HiddenNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

extension View {
    func hiddenNavigationBarStyle() -> some View {
        modifier(HiddenNavigationBar())
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
