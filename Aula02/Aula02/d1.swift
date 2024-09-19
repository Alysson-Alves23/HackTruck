import SwiftUI

struct BackgroundView: View {
    var body: some View {
        Image("truck1")
            .resizable()
            .scaledToFill()
            .ignoresSafeArea().overlay(Color.white.opacity(0.8))
    }
}

struct ScreenTitle: View {
    var nome: String
    
    var body: some View {
        Text("Bem vindo, " + nome)
            .font(.largeTitle)
            .foregroundColor(.black)
            .padding()
            .cornerRadius(10)
    }
}
struct IconView:View {
    var body: some View {
        VStack{
            
            Image("logo").resizable().frame(width: 200, height: 100,alignment: .top).scaledToFit()
            Image("truck").resizable().frame(width: 200,height: 100).scaledToFit()
        }.padding(.top,-60)
    }
}

struct D1: View {
    @State var name: String = "";
    @State var showModal: Bool = false;
    var body: some View {
        ZStack {
            BackgroundView().zIndex(0)
            VStack {
                ScreenTitle(nome: name)
                    .zIndex(1)
                TextField("Nome",text:$name).multilineTextAlignment(.center).font(.headline)
                    .padding()
                Spacer()
                IconView()
                Spacer()
                Button{
                    showModal = true;
                }label: {
                    Text("Entrar").font(.headline).foregroundStyle(.blue)
                        .padding().cornerRadius(10)
                }.alert(isPresented: $showModal){
                    Alert(
                        title: Text("Alerta!"),
                        message: Text("Você irá iniciar o desafio da aula agora" )
                    )
                }
            }.zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/).frame(alignment: .top)
        }
        
        
    }
    
}

#Preview {
    D1()
}
