//
//  ContentView.swift
//  Calculator
//
//  Created by Juan Camilo Marín Ochoa on 12/05/23.
//

import SwiftUI

struct ContentView: View {
    @State var value = "0"
    @State var runningNumber: Double = 0
    @State var currentOperation: OperationsModel = .none
    
    let buttons: [[Buttons]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal],
    ]
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                // Text display
                HStack {
                    Spacer()
                    
                    Text(value)
                        .font(.system(size: 100))
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)
                        .foregroundColor(.white)
                }
                .padding()
                .padding(.bottom, 10)
                
                // Our buttons
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { item in
                            Button(action: {
                                self.didTap(button: item)
                            }, label: {
                                item.buildView
                                    .frame(
                                        width: self.buttonWidth(item: item),
                                        height: self.buttonHeight()
                                    )
                                    .background(item.color)
                                    .foregroundColor(.white)
                                    .cornerRadius(self.buttonWidth(item: item)/2)
                            })
                        }
                    }
                    .padding(.bottom, 3)
                }
            }
        }
    }
    
    private func getValue() -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        
        return formatter.string(from: NSNumber(value: Double(value) ?? 0)) ?? "0"
    }
    
    private func didTap(button: Buttons) {
        switch button {
        case .add:
            currentOperation = .add
            runningNumber = Double(value) ?? 0
            value = "0"
        case .subtract:
            currentOperation = .subtract
            runningNumber = Double(value) ?? 0
            value = "0"
        case .multiply:
            currentOperation = .multiply
            runningNumber = Double(value) ?? 0
            value = "0"
        case .divide:
            currentOperation = .divide
            runningNumber = Double(value) ?? 0
            value = "0"
        case .equal:
            let runningValue = runningNumber
            let currentValue = Double(value) ?? 0
            
            switch currentOperation {
            case .add:
                value = "\(runningValue + currentValue)"
            case .subtract:
                value = "\(runningValue - currentValue)"
            case .multiply:
                value = "\(runningValue * currentValue)"
            case .divide:
                value = "\(runningValue / currentValue)"
            case .none:
                break
            }
        case .percent:
            let runningValue = runningNumber
            let currentValue = Double(value) ?? 0
            
            currentOperation = .none
            value = "\(runningValue - ((runningValue * currentValue) / 100))"
        case .clear:
            value = "0"
        case .decimal:
            value = "\(value)."
        case .negative:
            break
        default:
            let number = button.rawValue
            
            if value == "0" {
                value = number
            } else {
                value = "\(value)\(number)"
            }
        }
    }
    
    private func buttonWidth(item: Buttons) -> CGFloat {
        if item == .equal {
            return ((UIScreen.main.bounds.width - (4 * 12)) / 4) * 2
        }
        
        return (UIScreen.main.bounds.width - (5 * 12)) / 4
    }
    
    private func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - (5 * 12)) / 4
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
