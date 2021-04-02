//
//  GameViewController.swift
//  OXGame
//
//  Created by Shubham Kulthe on 28/06/20.
//  Copyright © 2020 Shubham Kulthe. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var playerTurnLabel: UILabel!
    @IBOutlet weak var player1Label: UILabel!
    @IBOutlet weak var player2Label: UILabel!
    @IBOutlet weak var gameOnLabel: UILabel!
    
    
    // 1st we define multidimessional array of Interger
    var matrix: [[Int]] = [[0,0,0],[0,0,0],[0,0,0]] //0 repersnt Nothing 1represent x and 2 represent O
    var whoseTurn = 0   //1-> player 1 //2-> for player 2
    var player1 = 0 // 0-nothing 1->x 2-<o
    var player2 = 0 // 0-nothing 1->x 2-<o
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        startGame()
    }
    
    
    //MARK:Step2 start the game
    func startGame(){
        
         var matrix: [[Int]] = [[0,0,0],[0,0,0],[0,0,0]]
         displayMaterix(matrix: matrix)
        
        whoseTurn = Int.random(in: 1...2)
            
        if(whoseTurn == 1){
             //its player 1 turn display O
            player1 = 1
            player2 = 2
            
            player1Label.text = "Player1 : X"
            player2Label.text = "Player2 : O"
            
            playerTurnLabel.text = "Player 1 Turn"
        }else{
            //its player 2 turn display O
            player1 = 2
            player2 = 1
            player1Label.text = "Player2 : O"
            player2Label.text = "Player1  : X"
            
            playerTurnLabel.text = "Player 2 Turn"
        }
    }
    
    //MARK:Step1
    func displayMaterix(matrix:[[Int]]){
        
        var tempTag = 1
     
        //MARK: - Displaying Image inside BUtton
        for i in 0...2{ //row
            for j in 0...2{ //column
                if (matrix[i][j] == 0){
                    
                    let tempButton = self.view.viewWithTag(tempTag) as? UIButton
                    tempButton?.setBackgroundImage(nil, for: .normal)
                    
                }else if(matrix[i][j] == 1){
                    
                    let tempButton = self.view.viewWithTag(tempTag) as? UIButton
                    tempButton?.setBackgroundImage(UIImage(named: "X"), for: .normal)
                    
                }else if(matrix[i][j] == 2){
                    
                    let tempButton = self.view.viewWithTag(tempTag) as? UIButton
                    tempButton?.setBackgroundImage(UIImage(named: "O"), for: .normal)
                    
                }else{
                    
                }
                tempTag += 1
            }
        }
    }
    
    @IBAction func buttonClickXorO(_ sender: Any) {
        
        //MARK:Step3
        var tempobj = 0
        if(whoseTurn == 1){
             //its player 1 turn display O
            tempobj = player1
            playerTurnLabel.text = "Player 1 Turn"
        }else{
            //its player 2 turn display O
            tempobj = player2
            playerTurnLabel.text = "Player 2 Turn"
        }
        
        guard let button = sender as? UIButton else{
          return
        }
       
        switch button.tag {
        case 1:
            if(matrix[0][0] == 0){
                matrix[0][0] = tempobj
                justPlayed()
            }
        case 2:
            if(matrix[0][1] == 0){
                matrix[0][1] = tempobj
                justPlayed()
            }
       case 3:
            if(matrix[0][2] == 0){
                matrix[0][2] = tempobj
                justPlayed()
            }
       case 4:
            if(matrix[1][0] == 0){
                matrix[1][0] = tempobj
                justPlayed()
            }
       
        case 5:
             if(matrix[1][1] == 0){
                 matrix[1][1] = tempobj
                 justPlayed()
             }
        case 6:
             if(matrix[1][2] == 0){
                 matrix[1][2] = tempobj
                 justPlayed()
             }
        case 7:
             if(matrix[2][0] == 0){
                 matrix[2][0] = tempobj
                 justPlayed()
             }
        case 8:
             if(matrix[2][1] == 0){
                 matrix[2][1] = tempobj
                 justPlayed()
             }
        case 8:
             if(matrix[2][2] == 0){
                 matrix[2][2] = tempobj
                 justPlayed()
             }
        
            
        default:
            print("Some error Occure !!")
        }
        
    }
    
    
    func justPlayed(){
        displayMaterix(matrix: matrix)
        checkWhoWine()
        
        if(whoseTurn == 1){
            whoseTurn = 2
            playerTurnLabel.text = "Player 2 Turn"
        }else{
            whoseTurn = 1
             playerTurnLabel.text = "Player 1 Turn"
        }
        
    }
    
    func checkWhoWine(){
      
        var counter = true
        if((matrix[0][0] == matrix[1][1]) && (matrix[1][1] == matrix[2][2]) && matrix[1][1] != 0){
            declarWinner(whoWon: matrix[1][1])
            
        }else if((matrix[2][0] == matrix[1][1]) && (matrix[1][1] == matrix[0][2]) && matrix[1][1] != 0){
           declarWinner(whoWon: matrix[1][1])
            
        }else{
            //for rows
            for i in 0...2{
                if((matrix[i][0] == matrix[i][1]) && (matrix[i][1] == matrix[i][2]) && matrix[i][0] != 0){
                    declarWinner(whoWon: matrix[i][0])
                    counter = false
                }
            }
            
            //For Colume
            if counter{
            for i in 0...2{
                if((matrix[0][i] == matrix[1][i]) && (matrix[1][i] == matrix[2][i]) && matrix[0][i] != 0){
                    declarWinner(whoWon: matrix[0][i])
                    }
                }
                
            }
           
        }
        
    }
    
    func declarWinner(whoWon:Int){
        
        if(whoWon == player1){
            //player 1 win
            gameOnLabel.text = "Player 1 Win !!"
        }else if(whoWon == player2){
            //player 2 win
            gameOnLabel.text = "Player 2 Win !!"
        }else{
            print("No win")
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
