//
//  PlaceAnnotationView.swift
//  FBLA WAtour
//
//  Created by Ishita Mundra on 5/25/22.
//

import SwiftUI

// This view places the annotation on the mapView
// The annotation is a pin that contains the image of the attraction and an attached link to Google Maps
struct PlaceAnnotationView: View {
    @State var showTitle = true
    
    let title: String
    
    var body: some View {
        
        // Identifies a url with a search query of the attraction name to link to Google Maps
        let urlTitle = title.replacingOccurrences(of: " ", with: "%20")
        let urlStr = "https://google.com/maps?q=" + urlTitle
        let url = URL(string: urlStr)
        
        VStack(spacing: 0) {
            
            // When annotation is clicked, a link is displayed that the user can click to transfer them to Google Maps
            Link(destination: url!) {
                Label(title + " in Google Maps", systemImage: "link")
                    .font(.callout)
                    .padding(5)
                    .background(Color.white)
                    .cornerRadius(10)
                    .opacity(showTitle ? 0 : 1)
                }
            
            // An image of the attraction in the shape of a circle is displayed on the annotation
            Image(title + " Circle")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 50)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 25/10))
                .shadow(radius: 10)
                .font(.title)
            
            // Creates a pin shape
            Image(systemName: "arrowtriangle.down.fill")
              .font(.caption)
              .foregroundColor(.white)
        }
        
        // When annotation is clicked, a label to Google Maps is displayed to the user.
        .onTapGesture {
          withAnimation(.easeInOut) {
            showTitle.toggle()
          }
        }

    }
}

struct PlaceAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceAnnotationView(title: "")
    }
}
