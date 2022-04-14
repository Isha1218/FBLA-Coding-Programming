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
            // Provides user access to the page for the first attribute
            // Layout is formatted in the shape of a box
            ZStack {
                ScrollView {
                    Text("WAtour")
                        .font(Font.custom("Montserrat-Bold", size: 40))
                        .fontWeight(.heavy)
                        .foregroundColor(.accentColor)
                    Group {
                        NavigationLink(destination: Attribute1()        .hiddenNavigationBarStyle()) {
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
                                    )
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
                                Text("Featured Location: Diablo Lake")
                                    .font(.title2)
                                    .foregroundColor(Color.white)
                                    .bold()
                                    .frame(width: 310, height: 200)
                                    .padding(20)
                                    .background(
                                        Image("Diablo Lake")
                                            .resizable()
                                            .opacity(0.9)
                                        )
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
                                        )
                                    .cornerRadius(20)
                            }
                        )
                
                    }
                }
            }
        }
    }
}

// Hides the default back button associated with Naviagation View
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
