enum GameState {
    case win
    case lose
    case draw
    case start
    
    var textValue: String{
        switch self{
        case .win:
            return "Ganaste"
        case .lose:
            return "Perdiste"
        case .draw:
            return "Empate"
        case .start:
            return "Piedra, papel o tijeras"
        }
    }
    
    
}
