//
//  Attribute3.swift
//  WaTourIshitaM
//
//  Created by Ishita Mundra on 12/31/21.
//

import SwiftUI

struct Attribute3View: View {
    
    @Binding var attribute1: String
    @Binding var attribute2: String
    @State var attribute3 = ""
    @State var isActive = false
    
    var body: some View {
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
                GroupBox {
                    DisclosureGroup("Price Range") {
                        // Price Ranges - do after making list of tourist locations
                        
                        Button("$0", action: {
                            attribute3 = "10"
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
                    .foregroundColor(Color.accentColor)
                }
                Spacer()
                .background(
                    NavigationLink(destination: Attribute4View(attribute1: $attribute1, attribute2: $attribute2, attribute3:$attribute3), isActive: $isActive) {
                        EmptyView()
                                
                })
            }
        }
    }
    
}

struct Attribute3View_Previews: PreviewProvider {
    static var previews: some View {
        Attribute3View(attribute1: .constant(""), attribute2: .constant(""))
    }
}
