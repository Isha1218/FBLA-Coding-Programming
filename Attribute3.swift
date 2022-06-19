//
//  Attribute3.swift
//  FBLA WAtour
//
//  Created by Ishita Mundra on 12/31/21.
//
import SwiftUI

// This view allows the user to input the third attribute
// The third attribute is the price that the user must pay to enter
// This price is per person rather than combined individuals
struct Attribute3: View {
    
    // attribute1 and attribute2 are passed to this view
    // attribute3 will be assigned a value in this view and passed along to the other views
    @Binding var attribute1: String
    @Binding var attribute2: String
    @State var attribute3 = ""
    @State var isActive = false
    @State var isExpanded: Bool
    
    var body: some View {
        
        // Layout and design of the page
        ZStack {
            Rectangle()
                .fill(Color.black.opacity(0.5))
                .ignoresSafeArea()
            Image("Mount Rainier")
                .resizable()
                .ignoresSafeArea()
                .opacity(0.75)
            VStack {
                VStack {
                    HStack {
                        Text("Current Selection (2/5):")
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
                        NavigationLink(destination: Attribute2(attribute1: $attribute1)) {
                            Text("2. " + attribute2)
                                .font(.title3)
                                .foregroundColor(Color.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 30)
                        }
                    }
                }
                Spacer()
                Text("3: Price")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.accentColor)
                    .shadow(color: Color.black, radius: 1, x:1, y:1)
                    .padding()
                Spacer()
                
                // Similar dropdown menus for the other attribute pages, but with different items listed
                // Contains the price ranges: Free, ≤ $10, ≤ $20, ≤ $30, ≤ $40, ≤ $50, ≤ $100, ≤ $1000.
                GroupBox {
                    DisclosureGroup("Price Range") {
                        Button("Free", action: {
                            attribute3 = "0"
                            isActive = true
                        })
                            .padding(.top)
                        
                        Button("≤ $10", action: {
                            attribute3 = "10"
                            isActive = true
                        })
                            .padding(.top)
                        
                        Button("≤ $20", action: {
                            attribute3 = "20"
                            isActive = true
                        })
                            .padding(.top)
                        Button("≤ $30", action: {
                            attribute3 = "30"
                            isActive = true
                        })
                            .padding(.top)
                        Button("≤ $40", action: {
                            attribute3 = "40"
                            isActive = true
                        })
                            .padding(.top)
                        Button("≤ $50", action: {
                            attribute3 = "50"
                            isActive = true
                        })
                            .padding(.top)
                        Button("≤ $100", action: {
                            attribute3 = "100"
                            isActive = true
                        })
                            .padding(.top)
                        Button("≤ $1000", action: {
                            attribute3 = "1000"
                            isActive = true
                        })
                            .padding(.top)
                    }
                    .frame(width: 300)
                }
                Spacer()
                
                // After the user has clicked one of the buttons from the dropdown menu, the Attribute4 page shows up
                // The variables, attribute1, attribute2, and attribute 3 are carried over to the next view
                .background(
                    NavigationLink(destination: Attribute4(attribute1: $attribute1, attribute2: $attribute2, attribute3: $attribute3, isExpanded: isExpanded), isActive: $isActive) {
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

struct Attribute3_Previews: PreviewProvider {
    static var previews: some View {
        Attribute3(attribute1: .constant(""), attribute2: .constant(""), isExpanded: false)
    }
}
