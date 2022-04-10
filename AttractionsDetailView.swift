//
//  AttractionsDetailView.swift
//  WaTourIshitaM
//
//  Created by Ishita Mundra on 3/19/22.
//

import SwiftUI
import MapKit

struct AttractionsDetailView: View {
    var attraction: Attraction
    
    var body: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: attraction.coordinate.latitude, longitude: attraction.coordinate.longitude), name: attraction.name)
        Text(attraction.name)
            .foregroundColor(.primary)
            .font(.title)
            .padding()
        VStack {
            List {
                HStack {
                    Text("More information")
                        .font(.headline)
                    Image(systemName: "arrow.turn.right.down")
                }
                .padding()
                Label("Location: " + attraction.loc + ", Washington", systemImage: "location")
                    .padding()
                    .foregroundColor(Color.purple)
                Label("Type of Location: " + attraction.typeOfLoc, systemImage: "building.2")
                    .padding()
                    .foregroundColor(Color.orange)
                Label("Price: $" + attraction.price, systemImage: "dollarsign.circle")
                    .padding()
                    .foregroundColor(Color.green)
                Label("Season: " + attraction.season, systemImage: "cloud")
                    .padding()
                    .foregroundColor(Color.blue)
                Label("Age Group: " + attraction.age, systemImage: "person")
                    .padding()
                    .foregroundColor(Color.red)
            }
        }
        .foregroundColor(Color.black)
    }
}

struct AttractionsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AttractionsDetailView(attraction: Attraction(name: "", loc: "", typeOfLoc: "", price: "", season: "", age: "", coordinate: CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)))
    }
}
 
