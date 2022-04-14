//
//  Attribute4.swift
//  WaTourIshitaM
//
//  Created by Ishita Mundra on 12/31/21.
//
import SwiftUI

// This view allows the user to input the fourth attribute
// The fourth attribute is the season when the user wishes to go to the tourist location
struct Attribute4: View {
    
    // attribute1, attribute2, and attribute3 are passed into this view
    // attribute4 will be assigned a value in this view and passed along to the other views
    @Binding var attribute1: String
    @Binding var attribute2: String
    @Binding var attribute3: String
    @State var attribute4 = ""
    @State var isActive = false
    
    var body: some View {
        
        // Layout and design of the page
        ZStack {
            Image("Tulip Field")
                .resizable()
                .ignoresSafeArea()
                .opacity(0.7)
            VStack {
                Text("WaTour")
                    .font(.title)
                    .foregroundColor(Color.blue)
                Spacer()
                Text("Attribute 4: Season")
                    .font(Font.custom("Lato", size:40.0))
                    .foregroundColor(Color.white)
                    .fontWeight(.black)
                    .padding()
                    .shadow(color: Color.black, radius: 1, x:1, y:1)
                Spacer()
                
                // Similar dropdown menus for the other attribute pages, but with different items listed
                // Contains the 4 seasons: Winter, Spring, Summer, Fall
                GroupBox {
                    DisclosureGroup("Season") {
                        Button("Fall", action: {
                            attribute4 = "Fall"
                            isActive = true
                        })
                            .padding(.top)
                        
                        Button("Winter", action: {
                            attribute4 = "Winter"
                            isActive = true
                        })
                            .padding(.top)
                        
                        Button("Spring", action: {
                            attribute4 = "Spring"
                            isActive = true
                        })
                            .padding(.top)
                        Button("Summer", action: {
                            attribute4 = "Summer"
                            isActive = true
                        })
                            .padding(.top)
                    }
                    .frame(width: 300)
                }
                Spacer()
                
                // After the user has clicked one of the buttons from the dropdown menu, the Attribute5 page shows up
                // The variables, attribute1, attribute2, attribute 3, and attribute4 are carried over to the next view
                .background(
                    NavigationLink(destination: Attribute5(attribute1: $attribute1, attribute2: $attribute2, attribute3:$attribute3, attribute4: $attribute4), isActive: $isActive) {
                        EmptyView()
                                
                })
            }
        }
    }
    
}

struct Attribute4_Previews: PreviewProvider {
    static var previews: some View {
        Attribute4(attribute1: .constant(""), attribute2: .constant(""), attribute3: .constant(""))
    }
}
