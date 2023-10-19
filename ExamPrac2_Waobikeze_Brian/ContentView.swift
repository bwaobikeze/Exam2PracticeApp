//
//  ContentView.swift
//  ExamPrac2_Waobikeze_Brian
//
//  Created by brian waobikeze on 10/18/23.
//

import SwiftUI

struct ContentView: View {
    @State private var Stations = [GasStation]()
    @State var priceVersion: String = "Regular"
    @State var gaspriceType: Double = 0.0
    @Environment(\.verticalSizeClass) var heightSize: UserInterfaceSizeClass?
        @Environment(\.horizontalSizeClass) var widthSize: UserInterfaceSizeClass?
    var body: some View {
        if heightSize == .regular{
            
        }else if heightSize == .compact{
            
        }
        NavigationView{
            VStack{
                Text("\(priceVersion) Gas").font(.title)
                List(Stations, id: \.station){ gasstation in
                    NavigationLink(destination: GasStationTabOfViews(stationgas: gasstation) ){
                        HStack{
                            Text(gasstation.station).font(.title2)
                            Spacer()
                            Text("$ \(formatPrice(gasstation.price(for: priceVersion)))").font(.title2)
                            
                        }.frame(height:100)
                        
                    }
                }
                .listStyle(PlainListStyle())
                .task {
                    await loadData()
                }
            }
            
        }
    }
    func formatPrice(_ price: Double) -> String {
        return String(format: "%.2f", price)
    }

    func loadData() async {
        guard let url = URL(string: "https://m.cpl.uh.edu/courses/ubicomp/fall2022/webservice/gas.json") else {
            print("Invalid URL")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode([GasStation].self, from: data)
            Stations=decodedResponse
        } catch {
            print("Error trying to decode JSON object: \(error.localizedDescription)")
        }
    }
}

#Preview {
    ContentView()
    //ContentView().previewInterfaceOrientation(.landscapeLeft)
}
