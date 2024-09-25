//
//  ContentView.swift
//  Aula 6
//
//  Created by Turma01-3 on 25/09/24.
//
import MapKit
import SwiftUI

struct Local: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    let flag: String
    let description: String
}
let bahiaCities: [Local] = [
    Local(
        name: "Juazeiro",
        coordinate: CLLocationCoordinate2D(latitude: -9.4167, longitude: -40.5033),
        flag: "juazeiro", // Placeholder for the actual flag image
        description: "A cidade de Juazeiro, situada na margem do Rio São Francisco."
    ),
    Local(
        name: "Senhor do Bonfim",
        coordinate: CLLocationCoordinate2D(latitude: -10.459, longitude: -40.189),
        flag: "sbf", // Placeholder for the actual flag image
        description: "Conhecida pela tradicional festa do Senhor do Bonfim."
    ),
    Local(
        name: "Salvador",
        coordinate: CLLocationCoordinate2D(latitude: -12.9714, longitude: -38.5014),
        flag: "salvador", // Placeholder for the actual flag image
        description: "Capital da Bahia, conhecida por suas praias e cultura rica."
    ),
    Local(
        name: "Feira de Santana",
        coordinate: CLLocationCoordinate2D(latitude: -12.2667, longitude: -38.9667),
        flag: "fs", // Placeholder for the actual flag image
        description: "A segunda maior cidade do estado, famosa por suas feiras e comércio."
    ),
    Local(
        name: "Ilhéus",
        coordinate: CLLocationCoordinate2D(latitude: -14.7935, longitude: -39.0393),
        flag: "ilheus", // Placeholder for the actual flag image
        description: "Cidade litorânea conhecida por sua produção de cacau e belas praias."
    )
]
struct modoSheet: View {
    @State var name: String;
    @State var flag: String;
    @State var description: String;
    var body: some View {
        
        VStack{
            Text(name).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
            Image(flag).resizable().scaledToFit()
            Text(description).font(.headline)
            Spacer()
        }
    }
}



struct ContentView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -9.4167, longitude: -40.5033), // Ponto inicial em Salvador
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    @State private var currentCity = "Juazeiro"
    @State private var sheetOn = false;
    var body: some View {
        ZStack{
            // Mapa que muda de região quando uma bandeira é selecionada
            Map(coordinateRegion: $region, annotationItems: bahiaCities) { city in
                    MapAnnotation(coordinate: city.coordinate) {
                        Button {
                            sheetOn = true
                        } label: {
                            Image(systemName: "flag.circle.fill")
                        }.sheet(isPresented: $sheetOn) {
                            modoSheet(name:city.name,flag:city.flag,description: city.description)
                    }
                }
                
                }
                .ignoresSafeArea()
            VStack{
                ZStack{
                    VStack{
                        Color.white.ignoresSafeArea().frame(width: 500,height: 100).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                        Spacer()
                    }
                    VStack{
                        Text("Mapa baiano").font(.largeTitle).padding(.top)
                        Text(currentCity).font(.headline)
                        Spacer()
                        
                    }
                }
            }
                
            VStack {
                
                Spacer().frame(minHeight: 600)
                // Barra horizontal de bandeiras scrollável
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(bahiaCities) { city in
                            Button(action: {
                                // Mudar a região do mapa para a cidade selecionada
                                withAnimation {
                                    region.center = city.coordinate
                                }
                            }) {
                                VStack {
        
                                    Image(city.flag).resizable().scaledToFit().frame(maxWidth: 100) // Pode usar imagens aqui se tiver as bandeiras
                                        .font(.largeTitle)
                                    Text(city.name)
                                        .foregroundColor(.primary)
                                        .font(.caption)
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
        }
}
}



#Preview {
    ContentView()
}
