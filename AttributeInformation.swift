//
//  AttributeInformation.swift
//  FBLA WAtour
//
//  Created by Ishita Mundra on 4/14/22.
//

import SwiftUI

// This view provides the user information about the algorithm
// From there, the user is able to input attributes to produce tourist locations
struct AttributeInformation: View {
    var body: some View {
        
        // Layout and design of the page
        VStack {
            Spacer()
            Text("Our Algorithm")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(20)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.white)
            Spacer()
            
            // Information about the algorithm
            Text("You will be asked to input 5 attributes. Based on your input, our algorithm will then suggest you five tourist attractions. You will have an opportunity to learn more about each of these locations.")
                .font(.title)
                .padding(20)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.white)
            Spacer()
            
            // Hides the back button when it goes to the Attribute page
            NavigationLink(destination: SearchAttribute().hiddenNavigationBarStyle()) {
                Text("Next")
                    .font(.title2)
                    .foregroundColor(Color.black)
                    .bold()
                    .frame(width: 310, height: 30)
                    .padding(20)
                    .background(
                        RoundedRectangle(
                            cornerRadius:30,
                            style: .continuous)
                        .fill(Color.white)
                    )
            }
            .padding()
            
            // Hides the back button when it goes back to the Home page
            NavigationLink(destination: HomeScreen().hiddenNavigationBarStyle()) {
                Text("Return Home")
                    .font(.title2)
                    .foregroundColor(Color.black)
                    .bold()
                    .frame(width: 310, height: 30)
                    .padding(20)
                    .background(
                        RoundedRectangle(
                            cornerRadius:30,
                            style: .continuous)
                        .fill(Color.white)
                    )
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
    }
}

struct AttributeInformation_Previews: PreviewProvider {
    static var previews: some View {
        AttributeInformation()
    }
}
