import Foundation
import SwiftUI

// Estrutura para os dados
struct DataModel: Identifiable, Codable {
    var _id: String
    var _rev: String
    var umidade: String
    
    var id: String {
        return self._id
    }
    var umd:Double{
        return Double(umidade) ?? 0.0;
    }
}

// ViewModel para gerenciar os dados
class DataViewModel: ObservableObject {
    @Published var dataList: [DataModel] = []
    var timer: Timer?
    
    init() {
        // Configura o Timer para buscar os dados a cada 10 segundos
        startTimer()
    }
    
    // Função para iniciar o Timer
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { _ in
            self.fetchData()
        }
    }
    
    // Função para buscar dados da API
    func fetchData() {
        guard let url = URL(string: "http://127.0.0.1:1880/receberUnivasf") else {
            print("URL inválida")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Erro ao fazer a requisição:", error)
                return
            }
            
            guard let data = data else {
                print("Nenhum dado recebido")
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode([DataModel].self, from: data)
                DispatchQueue.main.async {
                    self.dataList = decodedData
                }
            } catch {
                print("Erro ao decodificar os dados:", error)
            }
        }
        
        task.resume()
    }
    
    // Parar o timer se necessário
    func stopTimer() {
        timer?.invalidate()
    }
}

// View para exibir os dados
struct HumidityDropView: View {
    var percentage: Double // Valor entre 0 e 100

    var body: some View {
        HStack{
            Spacer()
            GeometryReader { geometry in
                let validPercentage = max(0, min(percentage, 100))
                let dropImage = Image(systemName: "drop.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                ZStack(alignment: .bottom) {
                    // Gota de fundo (contorno)
                    dropImage
                        .foregroundColor(Color.gray.opacity(0.3))
                    
                    // Preenchimento da gota
                    dropImage
                        .foregroundColor(Color.blue)
                        .mask(
                            Rectangle()
                                .fill(Color.white)
                                .frame(height: (validPercentage / 100) * geometry.size.height)
                                .offset(y: (1 - validPercentage / 100) * geometry.size.height)
                        )
                }
            }
            .aspectRatio(1, contentMode: .fit) // Mantém a proporção quadrada
            Spacer()
        }
    }
}



struct CView: View {
    @StateObject var viewModel = DataViewModel()
    
    var body: some View {
            NavigationView {
                Group {
                    if let latestItem = viewModel.dataList.last{
                        VStack(alignment: .center, spacing: 15) {
                                
                            Text("Umidade: \(latestItem.umd, specifier: "%.2f")%")
                                .font(.title)
                                .foregroundColor(.blue)
                            HumidityDropView(percentage: latestItem.umd).padding(.leading,100)
                        }
                        .padding()
                    } else {
                        // Exibe um indicador de carregamento enquanto os dados não são carregados
                        VStack {
                            ProgressView("Carregando dados...")
                        }
                    }
                }
               
            }
            .onAppear {
                // A chamada inicial para fetchData já é feita pelo Timer no ViewModel
            }
        }
}
#Preview {
    CView()
}
