import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    var title: Text
    var message: Text
    var buttonTitle: Text
}

struct AlertContext {
    static let humanWin = AlertItem (title: Text("You win!"), message: Text("Congrats!"), buttonTitle: Text("Yeah"))
    static let computerWin = AlertItem (title: Text("Computer wins"), message: Text("AI gets smarter and smarter..."), buttonTitle: Text("Rematch"))
    static let draw = AlertItem (title: Text("Draw"), message: Text("Good luck next time"), buttonTitle: Text("Try again"))
}
