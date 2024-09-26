//
//  CharactersViewController.swift
//  Aula 7
//
//  Created by Turma01-3 on 26/09/24.
//

import SwiftUI


struct CharacterCardView: View {
    @State var img: String
    @State var name: String
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: img)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)  // Preenche o círculo sem distorcer a imagem
                        .frame(width: 100, height: 100)  // Tamanho uniforme
                        .clipShape(Circle())  // Torna a imagem circular
                        .overlay(Circle().stroke(Color.gray, lineWidth: 2))  // Borda cinza ao redor
                        .shadow(radius: 5)  // Sombra para destacar a imagem
                } else if phase.error != nil {
                    Text("Erro")
                        .frame(width: 100, height: 100)
                        .background(Color.gray)
                        .clipShape(Circle())
                } else {
                    ProgressView()  // Indicador de carregamento
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                }
            }
            
            Text(name)
                .font(.headline)
                .foregroundColor(.white)
                .padding(.leading)
            
            
            Spacer()
        }
        .padding()
    }
}
struct CharacterListView: View {
    @ObservedObject var viewModel = CharacterViewModel()
    
    var body: some View {
 
            
                ScrollView{

                ForEach(viewModel.characters) { character in
                    CharacterCardView(img: character.image ?? "404",name:character.name ?? "404")
                }
                
            }
            .onAppear {
                viewModel.fetchAllCharacters() // Chama a função quando a view aparece
            }
        }
    
}
struct CharacterViewHeader:View {
    @State var house: String = "Hogwarts Characters";
    @State var background: Color = Color("HogPrimary");
    @State var img: String = "hogbg";
    var body: some View {
        HStack{
            Spacer()
            Image(img).resizable().scaledToFit().frame(maxWidth: 220).padding(.vertical,50)
            Spacer()
        }.background(background)
        
    }
}


struct CharactersView: View {
    var color: Color = Color("HogSecondary");
    
    
    var body: some View {
        
        NavigationStack {
            ZStack{
                Color.gray
                VStack{
                    CharacterViewHeader()
                    CharacterListView()
                }
            }.ignoresSafeArea()
        }
        
    }
}
#Preview {
    CharactersView()
}
