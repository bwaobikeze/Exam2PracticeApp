//
//  GasStationDetailView.swift
//  ExamPrac2_Waobikeze_Brian
//
//  Created by brian waobikeze on 10/18/23.
//

import SwiftUI
//class fuelGrad: ObservableObject{
//    @Published var priceGrade:String = ""
//}

struct GasStationDetailView: View {
    @State var regularPrice: Double = 0.0
    @State var midPrice: Double = 0.0
    @State var premPrice: Double = 0.0
    @State var dies: Double = 0.0
    @State var regularGas: Bool = false
    @State var midGas: Bool = false
    @State var premGas: Bool = false
    @State var diesGas: Bool = false

    var body: some View {
        NavigationView{
        VStack{
            HStack{
                NavigationLink {
                    ContentView(priceVersion: "Regular")
                } label: {
                    Text("Regular").padding().background(.blue).foregroundStyle(.white)
                        
                }.isDetailLink(true)

                Text("\(regularPrice)")
            }
            .padding()
            HStack{
                NavigationLink {
                    ContentView(priceVersion: "Midgrade")
                } label: {
                    Text("Midgrade").padding().background(.blue).foregroundStyle(.white)
                }
 
                Text("\(midPrice)")
            }
            .padding()
            HStack{
                NavigationLink {
                    ContentView(priceVersion: "Premium")
                } label: {
                    Text("Premium").padding().background(.blue).foregroundStyle(.white)
                }

                Text("\(premPrice)")
            }
            .padding()
            HStack{
                NavigationLink {
                    ContentView(priceVersion: "Diesel")
                } label: {
                    Text("Diesal").padding().background(.blue).foregroundStyle(.white)
                }
                Text("\(dies)")
            }
            .padding()
        }

            
        }
    }
}

#Preview {
    GasStationDetailView()
}
