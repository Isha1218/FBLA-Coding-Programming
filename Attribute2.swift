//
//  Attribute2View.swift
//  WaTour
//
//  Created by Ishita Mundra on 12/29/21.
//

import SwiftUI

struct Attribute2View: View {
    
    @Binding var attribute1: String
    @State var attribute2 = ""
    @State var isActive = false
    
    var body: some View {
        ZStack {
            Image("The Seattle Great Wheel")
                .resizable()
                .ignoresSafeArea()
                .opacity(0.75)
            VStack {
                Text("WaTour")
                    .font(.title)
                    .foregroundColor(Color.blue)
                Spacer()
                Text("Attribute 2: Type of Attraction")
                    .font(Font.custom("Lato", size:40.0))
                    .foregroundColor(Color.yellow)
                    .fontWeight(.black)
                    .padding()
                    .shadow(color: Color.black, radius: 1, x:1, y:1)
                Spacer()
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
                        
                        Button("Cultural Attraction", action: {
                            attribute2 = "Culture"
                            isActive = true
                        })
                            .padding(.top)
                        
                        Button("Art", action: {
                            attribute2 = "Art"
                            isActive = true
                        })
                            .padding(.top)
                        
                        Button("Other", action: {
                            attribute2 = "Other"
                            isActive = true
                        })
                            .padding(.top)
                    }
                    .frame(width: 300)
                    .foregroundColor(Color.accentColor)
                }
                Spacer()
                .background(
                    NavigationLink(destination: Attribute3View(attribute1: $attribute1, attribute2: $attribute2), isActive: $isActive) {
                        EmptyView()
                            
                })
            }
        }
    }
}

struct Attribute2View_Previews: PreviewProvider {
    static var previews: some View {
        Attribute2View(attribute1: .constant(""))
    }
}

