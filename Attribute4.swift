//
//  Attribute4.swift
//  WaTourIshitaM
//
//  Created by Ishita Mundra on 12/31/21.
//

import SwiftUI

struct Attribute4View: View {
    
    @Binding var attribute1: String
    @Binding var attribute2: String
    @Binding var attribute3: String
    @State var attribute4 = ""
    @State var isActive = false
    
    var body: some View {
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
                    .foregroundColor(Color.accentColor)
                }
                Spacer()
                .background(
                    NavigationLink(destination: Attribute5View(attribute1: $attribute1, attribute2: $attribute2, attribute3:$attribute3, attribute4: $attribute4), isActive: $isActive) {
                        EmptyView()
                                
                })
            }
        }
    }
    
}

struct Attribute4View_Previews: PreviewProvider {
    static var previews: some View {
        Attribute4View(attribute1: .constant(""), attribute2: .constant(""), attribute3: .constant(""))
    }
}
