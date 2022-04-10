//
//  ContentView.swift
//  WaTour
//
//  Created by Ishita Mundra on 12/29/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var attribute1 = ""
    @State var isActive = false
    
    var body: some View {
        NavigationView {
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
                    GroupBox {
                        DisclosureGroup("Locations") {
                            Button("Seattle") {
                                attribute1 = "Seattle"
                                isActive = true
                                print(attribute1)
                            }
                            .padding(.top)
                            Button("Tacoma") {
                                attribute1 = "Tacoma"
                                isActive = true
                                print(attribute1)
                            }
                            .padding(.top)
                            
                            Button("Bellevue") {
                                attribute1 = "Bellevue"
                                isActive = true
                                print(attribute1)
                            }
                            .padding(.top)
                            
                            Button("Olympia") {
                                attribute1 = "Olympia"
                                isActive = true
                                print(attribute1)
                            }
                            .padding(.top)
                            
                            Button("Friday Harbor") {
                                attribute1 = "Friday Harbor"
                                isActive = true
                                print(attribute1)
                            }
                            .padding(.top)
                            
                            Button("Other") {
                                attribute1 = "Other"
                                isActive = true
                                print(attribute1)
                            }
                            .padding(.top)
                            
                        }
                    }
                    .frame(width: 300)
                    .foregroundColor(Color.accentColor)
                    Spacer()
                }
                .background(
                    NavigationLink(destination: Attribute2View(attribute1: $attribute1), isActive: $isActive) {
                        EmptyView()
                        
                    })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
