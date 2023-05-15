//
//  Buttons.swift
//  Calculator
//
//  Created by Juan Camilo Marín Ochoa on 13/05/23.
//

import SwiftUI

enum Buttons: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "plus"
    case subtract = "minus"
    case divide = "divide"
    case multiply = "multiply"
    case equal = "equal"
    case clear = "C"
    case decimal = "."
    case percent = "percent"
    case negative = "plus.forwardslash.minus"
    
    var color: Color {
        switch self {
        case .add, .subtract, .multiply, .divide, .equal:
            if #available(iOS 15.0, *) {
                return .cyan
            } else {
                return .blue
            }
        case .clear, .negative, .percent:
            return .gray
        default:
            return .white.opacity(0.12)
        }
    }
    
    var value: String {
        switch self {
        case .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .zero, .clear, .decimal: return "0"
        case .add: return "+"
        case .subtract: return "-"
        case .divide: return "÷"
        case .multiply: return "x"
        case .equal: return "="
        case .percent: return "%"
        case .negative: return "-/+"
        }
    }
    
    var buildView: some View {
        var response: AnyView
        
        switch self {
        case .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .zero, .clear, .decimal:
            response = AnyView(
                Text(rawValue)
                    .font(.system(size: 32))
            )
        case .add, .subtract, .divide, .multiply, .percent, .negative:
            response = AnyView(
                Image(systemName: rawValue)
                    .font(.system(size: 26))
            )
        case .equal:
            response = AnyView(
                Image(systemName: rawValue)
                    .font(.system(size: 30))
            )
        }
        
        return response
    }
}
