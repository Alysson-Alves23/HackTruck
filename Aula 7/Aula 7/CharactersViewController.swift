//
//  CharactersViewController.swift
//  Aula 7
//
//  Created by Turma01-3 on 26/09/24.
//

import SwiftUI

struct House{
    let name: String
    let PrimaryColor: Color
    let SecondaryColor: Color
    let flag: String
}

func getHouse(name: String = "")-> House{
    
    switch name {
    case "Gryffindor":
        return House(name: name, PrimaryColor: Color("gryffindorPrimary"), SecondaryColor: Color("gryffindorSecondary"), flag: "gryffindor")
    case "Ravenclaw":
        return House(name: name, PrimaryColor: Color("ravenclawPrimary"), SecondaryColor: Color("ravenclawSecondary"), flag: "ravenclaw")

    case "Slytherin":
        return House(name: name, PrimaryColor: Color("slytherinPrimary"), SecondaryColor: Color("slytherinSecondary"), flag: "slytherin")

    case "Hufflepuff":
        return House(name: name, PrimaryColor: Color("hufflepuffPrimary"), SecondaryColor: Color("hufflepuffSecondary"), flag: "hufflepuff")

    default:
        return House(name: "Hogward", PrimaryColor: Color("HogPrimary"), SecondaryColor: Color("HogSecondary"), flag: "hogbg")

    }
}
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
                    NavigationLink(destination: CharacterDetailView(character: character)){
                        CharacterCardView(img: character.image ?? "404",name:character.name ?? "404")
                    }
                }
                
            }
            .onAppear {
                viewModel.fetchAllCharacters() // Chama a função quando a view aparece
            }
        }
    
}
struct CharacterViewHeader:View {
    @State var house: House = getHouse();

    var body: some View {
        HStack{
            Spacer()
            Image(house.flag).resizable().scaledToFit().frame(maxWidth: 220).padding(.vertical,50)
            Spacer()
        }.background(house.PrimaryColor)
        
    }
}
struct CharacterDetailView: View {
    @State var character: Character;
    @State var house : House = getHouse()
    var body: some View {
        ZStack{
            house.SecondaryColor.ignoresSafeArea()
            VStack{
                Rectangle().fill(house.PrimaryColor).frame(width: .infinity,height: 350).ignoresSafeArea().overlay{
                    HStack(alignment:.top){
                        Spacer().frame(height: 250)
                     
                        VStack(alignment:.trailing){
                            Image(house.flag).resizable().scaledToFill().ignoresSafeArea().opacity(0.5).frame(minWidth: 200)
                            Spacer().frame(width: 400)
                            
                        }
                       
                    }
                    }
                Spacer().frame(minHeight: 500)
            }
            VStack{
                AsyncImage(url: URL(string: character.image ?? "")) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 200, height: 200)  // Tamanho uniforme
                            .clipShape(Circle())  // Torna a imagem circular
                            .overlay(Circle().stroke(Color.gray, lineWidth: 2))  // Borda cinza ao redor
                            .shadow(radius: 5)  // Sombra para destacar a imagem
                    } else if phase.error != nil {
                        Text("Erro")
                            .frame(width: 200, height: 200)
                            .background(Color.gray)
                            .clipShape(Circle())
                    } else {
                        ProgressView()  // Indicador de carregamento
                            .frame(width: 200, height: 200)
                            .clipShape(Circle())
                    }
                }.padding()
                Spacer().frame(maxHeight: 75)
                HStack{
                    Text("Nome:")
                    Spacer()
                    Text(character.name ?? "")
                }
                HStack{
                    Text("Gênero:")
                    Spacer()
                    Text(character.gender ?? "")
                }
                HStack{
                    Text("Casa:")
                    Spacer()
                    Text(character.house ?? "")
                }
                HStack{
                    Text("Nascimento:")
                    Spacer()
                    Text(character.dateOfBirth ?? "")
                }
                HStack{
                    Text("Cor do Olho:")
                    Spacer()
                    Text(character.eyeColour ?? "")
                }
                HStack{
                    Text("Patrono:")
                    Spacer()
                    Text(character.patronus ?? "")
                }
                HStack{
                    Text("Patrono:")
                    Spacer()
                    Text(character.actor ?? "")
                }
                Spacer()
            }.foregroundColor(.white).padding()
            
        }.onAppear{
            house = getHouse(name:character.house ?? "")
        }
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
        }.accentColor(.white)
        
    }
}
#Preview {
    CharactersView()
}
