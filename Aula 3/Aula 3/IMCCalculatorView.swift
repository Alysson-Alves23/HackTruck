import SwiftUI

struct IMCCalculator {
    var peso: Float = 0
    var altura: Float = 0
    var imc: Float = -2

    mutating func calculate() {
        if altura > 0 {
            imc = peso / (altura * altura)
        } else {
            imc = -1
        }
    }

    func classification() -> (Color, String) {
        switch imc {
        case -2:
            return (Color.white, "Insira suas informações!")
        case 0..<18.5:
            return (Color("LOW"), "Baixo Peso")
        case 18.5..<25:
            return (Color("NORMAL"), "Normal")
        case 25..<30:
            return (Color("OVERWEIGHT").opacity(0.5), "Sobrepeso")
        case 30..<1000:
            return (Color("OBESE"), "Obeso")
        default:
            return (Color.white, "Valores inválidos")
        }
    }
}

struct FormView: View {
    @State var pesoText: String = ""
    @State var alturaText: String = ""
    @State var calculator: IMCCalculator = IMCCalculator()
    
    // Custom NumberFormatter for decimals
    let decimalFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 0
        formatter.locale = Locale.current
        return formatter
    }()
    
    var body: some View {
        VStack {
        
            Text("Calculadora de IMC")
                .font(.largeTitle)
                .bold()
                .padding()
            
            TextField("Peso (kg)", text: $pesoText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
                .padding()

            TextField("Altura (m)", text: $alturaText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
                .padding()
            
            Button {
                if let peso = Float(pesoText.replacingOccurrences(of: ",", with: ".")),
                   let altura = Float(alturaText.replacingOccurrences(of: ",", with: ".")) {
                    calculator.altura = altura
                    calculator.peso = peso
                    calculator.calculate()
                }
            } label: {
                Text("Calcular")
                    .foregroundColor(.white)
                    .frame(width: 100, height: 40)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding()
            }
            Spacer()
            Text(calculator.classification().1)
            Spacer()
            Image("tabela-IMC").resizable().scaledToFit().frame(minWidth: 450)
        }
        .frame(alignment: .top)
        .padding(10)
        .background(calculator.classification().0)
    }
}

struct CalculatorView: View {
    var body: some View {
        FormView()
    }
}

#Preview {
    CalculatorView()
}
