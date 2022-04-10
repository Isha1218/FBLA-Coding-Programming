//
//  Attribute5.swift
//  WaTourIshitaM
//
//  Created by Ishita Mundra on 12/31/21.
//

import SwiftUI

struct Attribute5View: View {
    
    @Binding var attribute1: String
    @Binding var attribute2: String
    @Binding var attribute3: String
    @Binding var attribute4: String
    @State var attribute5 = ""
    @State var isActive = false
    
    var body: some View {
        ZStack {
            Image("Stevens Pass")
                .resizable()
                .ignoresSafeArea()
                .opacity(0.75)
            VStack {
                Text("WaTour")
                    .font(.title)
                    .foregroundColor(Color.accentColor)
                Spacer()
                Text("Attribute 5: Age")
                    .font(Font.custom("Lato", size:40.0))
                    .foregroundColor(Color("darkbrown"))
                    .fontWeight(.black)
                    .padding()
                    .shadow(color: Color.black, radius: 1, x:1, y:1)
                Spacer()
                GroupBox {
                    DisclosureGroup("Required") {
                        
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
                    .foregroundColor(Color.accentColor)
                }
                Spacer()
                .background(
                    NavigationLink(destination: SuggestAttractionsView(attribute1: $attribute1, attribute2: $attribute2, attribute3: $attribute3, attribute4: $attribute4, attribute5: $attribute5), isActive:$isActive) {
                        EmptyView()
                    }
                )
            }
        }
    }
    
}

struct Attribute5View_Previews: PreviewProvider {
    static var previews: some View {
        Attribute5View(attribute1: .constant(""), attribute2: .constant(""), attribute3: .constant(""), attribute4: .constant(""))
    }
}
