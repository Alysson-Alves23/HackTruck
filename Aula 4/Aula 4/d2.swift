import SwiftUI

// Vistas de Destino com Plano de Fundo Azul Escuro
struct modo1: View {
    var body: some View {
       
        ZStack {
            // Plano de fundo azul escuro
            Color(red: 0/255, green: 0/255, blue: 50/255)
                .ignoresSafeArea()
            VStack{
                Text("Modo 1")
                    .font(.largeTitle).bold().foregroundColor(.white)
                   
                Spacer()
                
                VStack(alignment: .center) {
                    HStack {
                        Text("Nome:")
                            .fontWeight(.bold).foregroundColor(.white)
                       
                        Text("Alysson").foregroundColor(.white)
                    }
                    HStack {
                        Text("Sobrenome:")
                            .fontWeight(.bold).foregroundColor(.white)
                        Text("Alves").foregroundColor(.white)
                    }
                }
                .padding() // Padding interno do VStack
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.pink.opacity(0.79))
                        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 5).frame(minWidth: 300,minHeight: 200)
                )
               
                
                Spacer()
            }
        }

        }
    }


struct modo2: View {
    @State private var name: String = "" // Declaração correta do @State
    @State private var message: String = "Bem Vindo," // Estado para a mensagem
    @State private var isOn = true;
    var body: some View {
        ZStack {
            // Plano de fundo azul escuro
            Color(red: 0/255, green: 0/255, blue: 50/255)
                .ignoresSafeArea()
            
            VStack {
                // Título principal
                Text("Modo 2")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.bottom, 40) // Espaçamento abaixo do título
                
                Spacer()
                
                // Card com informações e botão
                VStack(alignment: .center, spacing: 20) {
                    // Campo de Texto Centralizado
                    if(isOn){
                        TextField("Nome", text: $name)
                            .padding()
                            .background(Color.white.opacity(0.2))
                            .cornerRadius(8)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center) // Centraliza o texto no TextField
                            .frame(width: 250, height: 50) // Ajuste de largura e altura
                    }
                    // Texto de Boas-Vindas ou Despedida
                    Text("\(message)\(name)")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                    if(isOn){
                        // Botão Centralizado
                        Button(action: {
                            // Ação do botão: Atualiza a mensagem
                            message = "Volte logo, "
                        }) {
                            Text("Acessar Tela")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 200, height: 50)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.blue) // Cor que combina com o padrão
                                )
                        }
                    }
                }
                .padding() // Espaçamento interno do card
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.pink.opacity(0.79))
                        .frame(width: 300, height: 200) // Dimensões ajustadas do card
                        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 5) // Sombra para profundidade
                )
                
                Spacer()
            }
            .padding() // Espaçamento externo da VStack
        }
    }
}



struct modoSheet: View {
    var body: some View {
        ZStack {
            // Plano de fundo azul escuro
            Color(red: 0/255, green: 0/255, blue: 50/255)
                .ignoresSafeArea()
            VStack{
                Text("Modo Sheet")
                    .font(.largeTitle).bold().foregroundColor(.white)
                   
                Spacer()
                
                VStack(alignment: .center) {
                    HStack {
                        Text("Nome:")
                            .fontWeight(.bold).foregroundColor(.white)
                       
                        Text("Thiago").foregroundColor(.white)
                    }
                    HStack {
                        Text("Sobrenome:")
                            .fontWeight(.bold).foregroundColor(.white)
                        Text("Pereira").foregroundColor(.white)
                    }
                }
                .padding() // Padding interno do VStack
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.pink.opacity(0.79))
                        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 5).frame(minWidth: 300,minHeight: 200)
                )
               
                
                Spacer()
            }
        
        }
    }
}

// Vista Principal `d2` com Plano de Fundo Azul Escuro
struct d2: View {
    @State private var showingSheet = false // Estado para apresentar a sheet
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                // Plano de fundo azul bem escuro
                Color(red: 0/255, green: 0/255, blue: 50/255)
                    .ignoresSafeArea(edges: .all) // Cobre toda a área disponível
            
                VStack(spacing: 20) { // Espaçamento entre os botões
                    Image("logo").resizable().scaledToFit().zIndex(2).frame(width: 300)
                    Spacer()
                    // Primeiro NavigationLink
                    NavigationLink(destination: modo1()) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.pink.opacity(0.79))
                                .frame(height: 100)
                                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                            
                            Text("Modo 1")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal) // Padding horizontal
                    }
                    
                    // Segundo NavigationLink
                    NavigationLink(destination: modo2()) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.pink.opacity(0.79))
                                .frame(height: 100)
                                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                            
                            Text("Modo 2")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal)
                    }
                    
                    // Terceiro Button para apresentar a Sheet
                    Button(action: {
                        showingSheet.toggle()
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.pink.opacity(0.79))
                                .frame(height: 100)
                                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                            
                            Text("Modo Sheet")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal)
                    }
                    .sheet(isPresented: $showingSheet) {
                        modoSheet()
                    }
                    Spacer()
                }
             
            }
        }
    }
}

// ContentView para Exibir a Vista `d2`
#Preview
{
   modo2()
}
