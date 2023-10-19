//
//  GasStationTabOfViews.swift
//  ExamPrac2_Waobikeze_Brian
//
//  Created by brian waobikeze on 10/18/23.
//

import SwiftUI
import MapKit

class fuelGrad: ObservableObject{
    @Published var regularGas: Bool = false
    @Published var midGas: Bool = false
    @Published var premGas: Bool = false
    @Published var diesGas: Bool = false
}
struct GasStationTabOfViews: View {
   @State var stationgas: GasStation
    @State var diffualgrad = fuelGrad()
    var body: some View {
        NavigationView{
            VStack{
                
            TabView{
                GasStationDetailView(regularPrice: stationgas.reg, midPrice: stationgas.mid, premPrice: stationgas.prem, dies: stationgas.dies)
                    .tabItem {
                        Image(systemName: "i.square")
                        Text("Details")
                    }
                GasStationMapView(region: MKCoordinateRegion(
                    center: CLLocationCoordinate2D(latitude: stationgas.gas_latitude, longitude: stationgas.gas_longitude),
                    span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                ), campostion: .automatic, capLat: stationgas.gas_latitude, capLong: stationgas.gas_longitude, stationName: stationgas.station)
                    .tabItem {
                        Image(systemName: "map")
                        Text("Map")
                    }
            }
        }
    }
    }
}

#Preview {
    var Stas = GasStation(
       station: "",
       reg: 0.0,
       mid: 0.0,
       prem: 0.0,
       dies: 0.0,
       gas_latitude: 0.0,
       gas_longitude: 0.0)
    return GasStationTabOfViews(stationgas: Stas)
}
