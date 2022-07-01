import SwiftUI
import Foundation


enum Player{
    case human, computer
}

struct Move {
    let player: Player
    let boardIndex: Int
    
    var indicator: String {
        return player == .human ? "xmark" : "circle"
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            GameView()
        }
    }
}
