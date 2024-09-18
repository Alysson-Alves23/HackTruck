//
//  ProfileNumbers.swift
//  Aula01
//
//  Created by Turma01-3 on 18/09/24.
//

import SwiftUI


struct NumberView: View {
    let name: String
    let value:String
    var body: some View {
        VStack{
            Text(value).bold()
            Text(name).fixedSize(horizontal: true, vertical: false)
        }
    }
}

struct ProfileNumbers: View {
    var body: some View {
        HStack{
            NumberView(name:"Posts",value:"8");
            NumberView(name:"Seguidores",value:"12k");
            NumberView(name:"Seguindo",value:"2k");
        }
    }
}
struct EditProfileButton: View {
    var body: some View {
        Button{
            
        }label: {
            Text("Editar Perfil")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .font(.headline).foregroundColor(.black)
                    .padding(.vertical).overlay(RoundedRectangle(cornerRadius: 8).fill(Color.gray.opacity(0.1))
                    )
                        
        }
    }
}
struct ProfileImage:View {
    var body: some View {
        Image("truck").resizable().scaledToFit()
        .clipShape(Circle())
    }
}
struct Bio: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Alysson Alves")
                .font(.headline)
            Text("Swift Developer")
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading) //
        .padding()
    }
}

struct ProfileHeader: View {
    var body: some View {
        
        VStack{
            HStack{
                ProfileImage().padding().frame(maxWidth: 150)
                VStack{
                    ProfileNumbers().scaledToFit()
                    EditProfileButton()
                }
            }.frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
        Bio()
    }
}


#Preview {
    ProfileHeader()
}
