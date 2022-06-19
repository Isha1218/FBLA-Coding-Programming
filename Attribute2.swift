//
//  Attribute2.swift
//  FBLA WAtour
//
//  Created by Ishita Mundra on 12/29/21.
//
import SwiftUI

// This view allows the user to input the second attribute
// The second attribute is the type of location (e.g. theme park, nature, etc.)
struct Attribute2: View {
    
    // attribute1 is a Binding to indicate that it was declared in another view
    // attribute2 will be asssigned a value in this view and passed along to the other views
    @Binding var attribute1: String
    @State var attribute2 = ""
    @State var isActive = false
    @State var isExpanded: Bool = true
    
    var body: some View {
        
        // Layout and design of the page
        ZStack {
            Rectangle()
                .fill(Color.black.opacity(0.5))
                .ignoresSafeArea()
            Image("The Seattle Great Wheel")
                .resizable()
                .ignoresSafeArea()
                .opacity(0.75)
            VStack {
                VStack {
                    HStack {
                        Text("Current Selection (1/5):")
                        Image(systemName: isExpanded == true ? "chevron.down" : "chevron.right")
                    }
                    .font(.title3)
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 30)
                    .onTapGesture {
                        isExpanded.toggle()
                    }
                    if isExpanded == true {
                        NavigationLink(destination: SearchAttribute().hiddenNavigationBarStyle()) {
                            Text("1. " + attribute1)
                                .font(.title3)
                                .foregroundColor(Color.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 30)
                        }
                    }
                }
                Spacer()
                Text("2: Type of Attraction")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.yellow)
                    .shadow(color: Color.black, radius: 1, x:1, y:1)
                    .padding()
                Spacer()
                
                // Layout of a dropdown menu with buttons pertaining to the various options.
                // These options include tje types of locations: Historical, Themepark, Nature, Landmark, Culture, Art, and Ski
                GroupBox {
                    DisclosureGroup("Type of Attraction") {
                        Button("Historical Attraction", action: {
                            attribute2 = "Historical"
                            isActive = true
                        })
                            .padding(.top)
                        
                        Button("Theme Park", action: {
                            attribute2 = "Theme Park"
                            isActive = true
                        })
                            .padding(.top)
                        Button("Nature", action: {
                            attribute2 = "Nature"
                            isActive = true
                        })
                            .padding(.top)
                        
                        Button("Landmark", action: {
                            attribute2 = "Landmark"
                            isActive = true
                        })
                            .padding(.top)
                        
                        Button("Art", action: {
                            attribute2 = "Art"
                            isActive = true
                        })
                            .padding(.top)
                        
                        Button("Cultural Attraction", action: {
                            attribute2 = "Culture"
                            isActive = true
                        })
                            .padding(.top)
                        
                        Button("Ski", action: {
                            attribute2 = "Ski"
                            isActive = true
                        })
                            .padding(.top)
                    }
                    .frame(width: 300)
                }
                Spacer()
                
                // After the user has clicked one of the buttons from the dropdown menu, the Attribute3 page shows up
                // The variables, attribute1 and attribute2 are carried over to the next view
                .background(
                    NavigationLink(destination: Attribute3(attribute1: $attribute1, attribute2: $attribute2, isExpanded: isExpanded), isActive: $isActive) {
                        EmptyView()
                })
                NavigationLink(destination: HomeScreen().hiddenNavigationBarStyle()) {
                    Image(systemName: "house.fill")
                        .foregroundColor(Color.white)
                        .font(.title)
                }
            }
        }

    }
}



struct Attribute2_Previews: PreviewProvider {
    static var previews: some View {
        Attribute2(attribute1: .constant(""))
    }
}
