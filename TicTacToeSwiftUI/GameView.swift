import SwiftUI

struct GameView: View {
    
    @StateObject private var viewModel = GameViewModel()
    
    var body: some View {
        GeometryReader{ geometry in
            VStack{
                Spacer()
                
                LazyVGrid(columns: viewModel.columns, spacing: 5) {
                    ForEach(0..<9) { i in
                        ZStack {
                            Circle()
                                .foregroundColor(.buttonClr).opacity(1)
                                .frame(width: geometry.size.width/3 - 10,
                                       height: geometry.size.width/3 - 10,
                                       alignment: .center)
                            
                            Image(systemName: viewModel.moves[i]?.indicator ?? " ")
                                .resizable()
                                .frame(width: 40, height: 40, alignment: .center)
                                .foregroundColor(.textClr)
                        }
                        .onTapGesture {
                            viewModel.processPlayerMove(for: i)
                        }
                    }
                }
                Spacer()
            }
            
            .padding(0.0)
            .background() {LinearGradient(gradient: Gradient(colors: [Color.topClr, Color.middleClr,Color.bottomClr]),startPoint: .top, endPoint: .bottom)}.ignoresSafeArea()
            .disabled(viewModel.isGameBoardDisabled)
            .alert(item: $viewModel.alertItem, content:  { alertItem in
                Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: .default(alertItem.buttonTitle, action: { viewModel.resetGame() } ))
            })
        }
    }
}
