//
//  ContentView.swift
//  Aula01
//
//  Created by Turma01-3 on 18/09/24.
//

import SwiftUI
struct Icon: View {
    var body: some View {
        
        Image("truck").resizable().scaledToFit().clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
    }
}
struct Descripton: View {
    var body: some View {
        VStack{
            Text("HackTruck").font(.largeTitle).foregroundStyle(.red).bold()
                
            Text("77 universidades").font(.headline).foregroundStyle(.blue)
            Text("5 regiões").font(.headline)
                .foregroundStyle(.yellow)
            
        }
    }
}
struct CardView: View {
    var body: some View {
        HStack{
            Icon()
            Descripton()
        }
    }
}

struct ContentView: View {
    var body: some View {
        CardView().padding()
    }
}

#Preview {
    ContentView()
}
