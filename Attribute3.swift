//
//  Attribute3.swift
//  WaTourIshitaM
//
//  Created by Ishita Mundra on 12/31/21.
//
import SwiftUI

// This view allows the user to input the third attribute
// The third attribute is the price range that the user is looking for
struct Attribute3: View {
    
    // attribute1 and attribute2 are passed to this view
    // attribute3 will be assigned a value in this view and passed along to the other views
    @Binding var attribute1: String
    @Binding var attribute2: String
    @State var attribute3 = ""
    @State var isActive = false
    
    var body: some View {
        
        // Layout and design of the page
        ZStack {
            Image("Mount Ranier")
                .resizable()
                .ignoresSafeArea()
                .opacity(0.75)
            VStack {
                Text("WaTour")
                    .font(.title)
                    .foregroundColor(Color.blue)
                Spacer()
                Text("Attribute 3: Price")
                    .font(Font.custom("Lato", size:40.0))
                    .foregroundColor(Color.accentColor)
                    .fontWeight(.black)
                    .padding()
                    .shadow(color: Color.black, radius: 1, x:1, y:1)
                Spacer()
                
                // Similar dropdown menus for the other attribute pages, but with different items listed
                // Contains the price ranges: $0, $1 - $10, $11 - $20, $21 - $30, $31 - $40, $41 - $50, $51 - $100, >$100.
                GroupBox {
                    DisclosureGroup("Price Range") {
                        Button("$0", action: {
                            attribute3 = "0"
                            isActive = true
                        })
                            .padding(.top)
                        
                        Button("$1 - $10", action: {
                            attribute3 = "10"
                            isActive = true
                        })
                            .padding(.top)
                        
                        Button("$11 - $20", action: {
                            attribute3 = "20"
                            isActive = true
                        })
                            .padding(.top)
                        Button("$21 - $30", action: {
                            attribute3 = "30"
                            isActive = true
                        })
                            .padding(.top)
                        Button("$31 - $40", action: {
                            attribute3 = "40"
                            isActive = true
                        })
                            .padding(.top)
                        Button("$41 - $50", action: {
                            attribute3 = "50"
                            isActive = true
                        })
                            .padding(.top)
                        Button("$51 - $100", action: {
                            attribute3 = "100"
                            isActive = true
                        })
                            .padding(.top)
                        Button(">$100", action: {
                            attribute3 = "101"
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
                    NavigationLink(destination: Attribute4(attribute1: $attribute1, attribute2: $attribute2, attribute3:$attribute3), isActive: $isActive) {
                        EmptyView()
                                
                })
            }
        }
    }
    
}

struct Attribute3_Previews: PreviewProvider {
    static var previews: some View {
        Attribute3(attribute1: .constant(""), attribute2: .constant(""))
    }
}
