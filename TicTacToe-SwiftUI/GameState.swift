//
//  GameState.swift
//  TicTacToe-SwiftUI
//
//  Created by M. Ahmad Ali on 03/01/2023.
//

import Foundation

class GameSate: ObservableObject {
    @Published var board = [[Cell]]()
    @Published var turn = Tile.Cross
    @Published var noughtScore = 0
    @Published var crossScore = 0
    @Published var showAlert = false
    @Published var alertMessage = "Draw"
    
    
    init() {
        resetBoard()
    }
    
    func resetBoard() {
        var newBoard = [[Cell]]()
        
        for _ in 0...2 {
            var row = [Cell]()
            for _ in 0...3 {
                row.append(Cell(tile: .Empty))
            }
            newBoard.append(row)
        }
        board = newBoard
    }
    func placeTile(for row: Int, for column: Int ) {
        if (board[row][column].tile  != Tile.Empty) {
            return
        }
        board[row][column].tile = turn == Tile.Cross ? Tile.Cross : Tile.Nought
        
        
        if (checkForVictory()) {
            var winner = ""
            if (turn == Tile.Cross) {
                crossScore += 1
                turn = Tile.Nought
                winner = "Crosses"
            } else if (turn == Tile.Nought) {
              noughtScore += 1
                turn = Tile.Cross
                winner = "Noughts"
            }
           
            alertMessage = "\(winner) win!"
            showAlert = true
        } else {
            turn = turn == Tile.Cross ? Tile.Nought : Tile.Cross
        }
        
        if (checkForDraw()) {
            alertMessage = "Draw"
            showAlert = true
        }
            
    }
    
    func checkForDraw() -> Bool {
        
        for row in board {
            for cell in row {
                if cell.tile == Tile.Empty {
                    return false
                }
            }
        }
        return true
    }
    
    func checkForVictory() -> Bool {
//         Verticals
        if isTurnTile(0, 0) && isTurnTile(1, 0) && isTurnTile(2, 0) {
            return true
        }
        if isTurnTile(0, 1) && isTurnTile(1, 1) && isTurnTile(2, 1) {
            return true
        }
        if isTurnTile(0, 2) && isTurnTile(1, 2) && isTurnTile(2, 2) {
            return true
        }
        
//         Horzizontal
        if isTurnTile(0, 0) && isTurnTile(0, 1) && isTurnTile(0, 2) {
            return true
        }
        if isTurnTile(1, 0) && isTurnTile(1, 1) && isTurnTile(1, 2) {
            return true
        }
        if isTurnTile(2, 0) && isTurnTile(2, 1) && isTurnTile(2, 2) {
            return true
        }
//        Diagonal
        if isTurnTile(0, 2) && isTurnTile(1, 1) && isTurnTile(2, 0) {
            return true
        }

        
        return false
    }
    
    func isTurnTile(_ row: Int, _ column: Int) -> Bool {
        return board[row][column].tile == turn
    }}
