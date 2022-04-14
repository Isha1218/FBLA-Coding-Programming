//
//  Attribute1.swift
//  FBLA WAtour
//
//  Created by Ishita Mundra on 4/9/22.
//

import SwiftUI

// This view allows the user to input the first attribute
// The first attribute is location
struct Attribute1: View {
    
    // attribute1 is passed through all 5 attribute views
    // Variable is added to a userAttributes array in SuggestAttractions
    @State var attribute1 = ""
    @State var isActive = false
    
    var body: some View {
        NavigationView {
            
            // Layout and design of the page
            ZStack {
                Image("Spaceneedle")
                    .resizable()
                    .ignoresSafeArea()
                    .opacity(0.7)
                VStack {
                    Text("WaTour")
                        .font(.title)
                        .foregroundColor(Color.accentColor)
                        .padding()
                        .padding()
                        .padding()
                        
                    Spacer()
                    Text("Attribute 1: Location")
                        .font(Font.custom("Lato", size:40.0))
                        .foregroundColor(Color.black)
                        .fontWeight(.black)
                        .padding()
                        .shadow(color: Color.black, radius: 1, x:1, y:1)
                    Spacer()
                    
                    // Allows the user to click a location from a dropdown
                    // This location is then recorded in the variable, attribute1
                    // isActive is set to true to indicate that the user has clicked one of the options
                    // Contains the locations: Seattle, Tacoma, Bellevue, Olympia, Firday Harbor, and Other
                    GroupBox {
                        DisclosureGroup("Locations") {
                            Button("Seattle") {
                                attribute1 = "Seattle"
                                isActive = true
                            }
                            .padding(.top)
                            Button("Tacoma") {
                                attribute1 = "Tacoma"
                                isActive = true
                            }
                            .padding(.top)
                            
                            Button("Bellevue") {
                                attribute1 = "Bellevue"
                                isActive = true
                            }
                            .padding(.top)
                            
                            Button("Olympia") {
                                attribute1 = "Olympia"
                                isActive = true
                            }
                            .padding(.top)
                            
                            Button("Friday Harbor") {
                                attribute1 = "Friday Harbor"
                                isActive = true
                            }
                            .padding(.top)
                            
                            Button("Other") {
                                attribute1 = "Other"
                                isActive = true
                            }
                            .padding(.top)
                            
                        }
                    }
                    .frame(width: 300)
                    Spacer()
                }
                
                // After the user has clicked one of the buttons from the dropdown menu, the Attribute2 page shows up
                // The variable, attribute1 is carried over to the next view
                .background(
                    NavigationLink(destination: Attribute2(attribute1: $attribute1), isActive: $isActive) {
                        EmptyView()
                    })
            }
        }
    }
}

struct Attribute1_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
