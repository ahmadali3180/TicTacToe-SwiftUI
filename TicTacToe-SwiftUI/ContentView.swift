//
//  ContentView.swift
//  TicTacToe-SwiftUI
//
//  Created by M. Ahmad Ali on 03/01/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var gameState = GameSate()
    var body: some View {
        
        let borderSize = CGFloat(10)
        
        VStack(spacing: borderSize) {
            ForEach(0...2, id : \.self ) {
                row in HStack(spacing: borderSize) {
                    ForEach(0...2, id : \.self ) {
                        column in
                        
                        let cell = gameState.board[row][column]
                        Text(cell.displayTitle())
                            .font(.system(size: 60))
                            .bold()
                            .foregroundColor(cell.tileColor())
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .aspectRatio(1, contentMode: .fit)
                            .background(.white)
                            .onTapGesture {
                                gameState.placeTile(for: row, for: column)
                            }
                    }
                }
            }
        }
        .background(.black)
        .padding(.all)
        .alert(isPresented: $gameState.showAlert) {
            Alert(
                title: Text(gameState.alertMessage),
                dismissButton: .default(Text("Ok")) {
                    gameState.resetBoard()
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
