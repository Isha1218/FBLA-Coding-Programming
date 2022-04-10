//
//  MapView.swift
//  WaTourIshitaM
//
//  Created by Ishita Mundra on 3/26/22.
//

import SwiftUI
import MapKit

struct Location: Identifiable {
    let name: String
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    var name: String
    @State private var region = MKCoordinateRegion()

    var body: some View {
        Map(coordinateRegion: $region,
            interactionModes: [.all],
            showsUserLocation: true,
            userTrackingMode: .constant(.follow),
            annotationItems: [
                Location(name: name, coordinate: coordinate)
            ]) { item in
                MapAnnotation(coordinate: item.coordinate) {
                    Image(name + " Circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 50)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 25/10))
                        .shadow(radius: 10)
                }
            }
            .onAppear {
                setRegion(coordinate)
            }
            .edgesIgnoringSafeArea(.all)
    }

    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0), name: "")
    }
}
