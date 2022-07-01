import SwiftUI

struct GameView: View {
    
    @StateObject private var gameViewModel = GameViewModel()
    
    var body: some View {
        
        GeometryReader{ geometry in
            
            VStack{
                
                Spacer()
                
                LazyVGrid(columns: gameViewModel.columns, spacing: 5) {
                    ForEach(0..<9) { i in
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.buttonClr).opacity(1)
                                .frame(width: geometry.size.width/3 - 10,
                                       height: geometry.size.width/3 - 10,
                                       alignment: .center)
                            Image(systemName: gameViewModel.moves[i]?.indicator ?? " ")
                                .resizable()
                                .frame(width: 40, height: 40, alignment: .center)
                                .foregroundColor(.textClr)
                        }
                        
                        .onTapGesture {
                            gameViewModel.processPlayerMove(for: i)
                        }
                        
                    }
                }
                
                .frame(maxWidth: .infinity)
                .padding(10)
                .background(.thinMaterial)
                Spacer()
                    .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                
                Button (action: gameViewModel.resetGame){
                    Text ("Reset")
                    .fontWeight(.bold)
                    .font(.title)
                    .padding()
                    .background(Color.buttonClr)
                    .foregroundColor(.white)
                    .padding(10)
                    .border(Color.buttonClr, width: 5)}
                Spacer().frame(height: 50)
            }
   
            
            .padding(0.0)
            .background() {LinearGradient(gradient: Gradient(colors: [Color.topClr, Color.bottomClr]),startPoint: .top, endPoint: .bottom)}.ignoresSafeArea()
            .disabled(gameViewModel.isGameBoardDisabled)
            .alert(item: $gameViewModel.alertItem, content:  { alertItem in
                Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: .default(alertItem.buttonTitle, action: { gameViewModel.resetGame() } ))
            })
        }
    }
}
