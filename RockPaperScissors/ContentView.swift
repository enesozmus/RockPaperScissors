//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by enesozmus on 5.03.2024.
//

import SwiftUI

struct ContentView: View {
    
    let _options = ["👊", "✋", "✌️"]
    
    @State private var _appChoise = Int.random(in: 0..<3)
    @State private var _shouldWin = false
    
    @State private var _score = 0
    @State private var _round = 1
    @State private var _scoreAlert = false
    
    
    var body: some View {
        ZStack {
            VStack{
                Spacer()
                Text("Computer has played")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text(_options[_appChoise])
                    .font(.system(size: 200))
                if _shouldWin{
                    Text("Which one wins?")
                        .font(.system(size: 50))
                        .foregroundColor(.green)
                } else {
                    Text("Which one loses")
                        .font(.system(size:50))
                        .foregroundColor(.red)
                }
                HStack{
                    ForEach(0..<3){ number in
                        Button(_options[number]){
                            game(number)
                        }
                        .font(.system(size: 80))
                    }
                }
                Spacer()
                Text("score: \(_score)")
                    .font(.system(size:40))
                Text("round: \(_round)/7")
                    .font(.system(size:20))
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                Spacer()
            }
        }
        .alert("Game Over", isPresented: $_scoreAlert) {
            Button("Play Again", action: restartGame)
        } message: {
            Text("Your score was \(_score)")
        }
    }
    
    // Function 1
    func game(_ number: Int) {
        let winningMoves = [1, 2, 0]
        var didWin: Bool
        
        if _shouldWin {
            didWin = number == winningMoves[_appChoise]
        } else {
            didWin = winningMoves[number] == _appChoise
        }
        
        if didWin {
            _score += 1
        } else {
            _score -= 1
        }
        
        if _round != 7{
            _round += 1
            _appChoise = Int.random(in: 0..<3)
            _shouldWin.toggle()
        } else{
            _scoreAlert = true
        }
    }
    
    // Function 2
    func restartGame() {
        _score = 0
        _round = 1
        _appChoise = Int.random(in: 0..<3)
        _shouldWin = Bool.random()
    }
}


#Preview {
    ContentView()
}
