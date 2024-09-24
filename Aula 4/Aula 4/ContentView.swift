import SwiftUI

struct NavBar: View {
    var body: some View {
        TabView {
            // Primeiro Tab
            VStack {
                Color.pink
                    .overlay(
                        Image(systemName: "paintbrush")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                    )
            }
            .tabItem {
                Text("Rosa").bold()
                Image(systemName: "paintbrush")
            }
            
          
                Color.blue
                    .overlay(
                        Image(systemName: "paintbrush.pointed.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                    )
            
            .tabItem {
                Text("Azul").bold()
                Image(systemName: "paintbrush.pointed.fill")
            }
            
            // Terceiro Tab
            VStack {
                Color.gray
                    .overlay(
                        Image(systemName: "paintpalette")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                    )
            }
            .tabItem {
                Text("Cinza").bold()
                Image(systemName: "paintpalette")
            }
            
            // Quarto Tab
            VStack {
                Color.white
                    .overlay(
                        List {
                            HStack {
                                Text("Paintbrush")
                                Spacer()
                                Image(systemName: "paintbrush")
                            }
                            HStack {
                                Text("Pointed PaintBrush")
                                Spacer()
                                Image(systemName: "paintbrush.pointed.fill")
                            }
                            HStack {
                                Text("Paint Palette")
                                Spacer()
                                Image(systemName: "paintpalette")
                            }
                        }
                        .listStyle(PlainListStyle())
                    )
            }
            .tabItem {
                Image(systemName: "list.dash")
                Text("Lista")
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        NavBar()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
