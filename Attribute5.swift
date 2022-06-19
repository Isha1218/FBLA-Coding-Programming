//
//  Attribute5.swift
//  FBLA WAtour
//
//  Created by Ishita Mundra on 12/31/21.
//
import SwiftUI

// This view allows the user to input the fifth attribute
// The fifth attribute is the age group of the individuals that will be going to the tourist location
struct Attribute5: View {
    
    // attribute1, attribute2, attribute3, and attribute4 are passed into this view
    // attribute5 will be assigned a value in this view and passed along SuggestAttractions
    @Binding var attribute1: String
    @Binding var attribute2: String
    @Binding var attribute3: String
    @Binding var attribute4: String
    @State var attribute5 = ""
    @State var isActive = false
    @State var isExpanded = false
    
    var body: some View {
        
        // Layout and design of page
        ZStack {
            Rectangle()
                .fill(Color.black)
                .ignoresSafeArea()
            Image("Stevens Pass")
                .resizable()
                .ignoresSafeArea()
                .opacity(0.75)
            VStack {
                VStack {
                    HStack {
                        Text("Current Selection (4/5):")
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
                        NavigationLink(destination: Attribute3(attribute1: $attribute1, attribute2: $attribute2, isExpanded: isExpanded)) {
                            if attribute3 == "0" {
                                Text("3. Free")
                                    .font(.title3)
                                    .foregroundColor(Color.white)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 30)
                            }
                            else {Text("3. ≤ $" + attribute3)
                                .font(.title3)
                                .foregroundColor(Color.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 30)
                            }
                        }
                        NavigationLink(destination: Attribute4(attribute1: $attribute1, attribute2: $attribute2, attribute3: $attribute3, isExpanded: isExpanded)) {
                            Text("4. " + attribute4)
                                .font(.title3)
                                .foregroundColor(Color.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 30)
                        }
                    }
                }
                Spacer()
                Text("5: Age Group")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.mint)
                    .shadow(color: Color.black, radius: 1, x:1, y:1)
                    .padding()
                Spacer()
                
                // Similar dropdown menus for the other attribute pages, but with different items listed
                // Contains the 3 main age groups: Kids, Adults, and Seniors
                GroupBox {
                    DisclosureGroup("Age Group") {
                        
                        Button("Kids", action: {
                            attribute5 = "Kids"
                            isActive = true
                        })
                            .padding(.top)
                        
                        Button("Adults", action: {
                            attribute5 = "Adults"
                            isActive = true
                        })
                            .padding(.top)
                        
                        Button("Seniors", action: {
                            attribute5 = "Seniors"
                            isActive = true
                        })
                            .padding(.top)
                    }
                    .frame(width: 300)
                }
                Spacer()
                
                // After the user has clicked one of the buttons from the dropdown menu, the program will suggest the top five locations based on the five attributes that the user inputtted
                // All five attribute variables are carried over to the SuggestAttractions view and added to a userAttributes array
                .background(
                    NavigationLink(destination: SuggestAttractions(attribute1: $attribute1, attribute2: $attribute2, attribute3: $attribute3, attribute4: $attribute4, attribute5: $attribute5), isActive:$isActive) {
                        EmptyView()
                    }
                )
                NavigationLink(destination: HomeScreen().hiddenNavigationBarStyle()) {
                    Image(systemName: "house.fill")
                        .foregroundColor(Color.white)
                        .font(.title)
                }
            }
        }
    }
    
}

struct Attribute5_Previews: PreviewProvider {
    static var previews: some View {
        Attribute5(attribute1: .constant(""), attribute2: .constant(""), attribute3: .constant(""), attribute4: .constant(""), isExpanded: false)
    }
}
