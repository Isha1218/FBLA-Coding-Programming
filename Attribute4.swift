//
//  Attribute4.swift
//  FBLA WAtour
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
    @State var isExpanded: Bool
    
    var body: some View {
        
        // Layout and design of the page
        ZStack {
            Rectangle()
                .fill(Color.black)
                .ignoresSafeArea()
            Image("Tulip Field")
                .resizable()
                .ignoresSafeArea()
                .opacity(0.7)
            VStack {
                VStack {
                    HStack {
                        Text("Current Selection (3/5):")
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
                    }
                }
                Spacer()
                Text("4: Season")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .shadow(color: Color.black, radius: 1, x:1, y:1)
                    .padding()
                Spacer()
                
                // Identifies the current season
                let season = findSeason()
                
                let seasonArr = newSeasonArray(season: season)
                
                // Similar dropdown menus for the other attribute pages, but with different items listed
                // Contains the 4 seasons: Winter, Spring, Summer, Fall
                GroupBox {
                    DisclosureGroup("Season") {
                        Button(season + " - Current", action: {
                            attribute4 = season
                            isActive = true
                        })
                            .padding(.top)
                        
                        Button(seasonArr[0], action: {
                            attribute4 = seasonArr[0]
                            isActive = true
                        })
                            .padding(.top)
                        
                        Button(seasonArr[1], action: {
                            attribute4 = seasonArr[1]
                            isActive = true
                        })
                            .padding(.top)
                        
                        Button(seasonArr[2], action: {
                            attribute4 = seasonArr[2]
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
                    NavigationLink(destination: Attribute5(attribute1: $attribute1, attribute2: $attribute2, attribute3:$attribute3, attribute4: $attribute4, isExpanded: isExpanded), isActive: $isActive) {
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
    
    // Finds the current season by accessing the current date
    func findSeason() -> String {
        let month = Calendar.current.component(.month, from: Date())
        let day = Calendar.current.component(.day, from: Date())
        var season: String = ""
        
        if (month > 6 && month < 9) || (month == 6 && day >= 21) || (month == 9 && day < 22) {
            season = "Summer"
        } else if (month > 9 && month < 12) || (month == 9 && day >= 22) || (month == 12 && day < 21) {
                season = "Fall"
        } else if (month > 12 && month < 3) || (month == 12 && day >= 21) || (month == 3 && day < 20) {
            season = "Winter"
        } else {
            season = "Spring"
        }
        return season
    }
    
    // Removes current season from 4 season array because the current season will be added separately
    func newSeasonArray(season: String) -> [String] {
        var seasonArr = ["Winter", "Spring", "Summer", "Fall"]
        for i in 0...3 {
            if seasonArr[i] == season {
                seasonArr.remove(at: i)
                break;
            }
        }
        return seasonArr
    }
    
}

struct Attribute4_Previews: PreviewProvider {
    static var previews: some View {
        Attribute4(attribute1: .constant(""), attribute2: .constant(""), attribute3: .constant(""), isExpanded: false)
    }
}
