import GameplayKit



enum Sign {
    case scissors
    case rock
    case paper
    
    var textValue: String {
        switch self {
        case .scissors:
            return "✂️"
        case .rock:
            return "⛰"
        case .paper:
            return "📄"
        }
    }
    
    func gameResult(versusState: Sign) -> GameState {
        if self == versusState{
            return .draw
        }
        switch self{
        case .paper:
            if versusState == .rock {
                return .win
            }
        case .rock:
            if versusState == .scissors {
                return .win
            }
        case .scissors:
            if versusState == .paper {
                return .win
            }
        }
        
        return .lose
    }
}


let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}


