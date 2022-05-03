//
//  MemoryViewController.swift
//  CrazyAlarm
//
//  Created by Vivian Duong on 5/2/22.
//

import UIKit

class MemoryViewController: UIViewController {
    
    @IBOutlet weak var gameButton1: UIButton!
    @IBOutlet weak var gameButton2: UIButton!
    @IBOutlet weak var gameButton3: UIButton!
    @IBOutlet weak var gameButton4: UIButton!
    @IBOutlet weak var gameButton5: UIButton!
    @IBOutlet weak var gameButton6: UIButton!
    
    let colorSet = [UIColor.purple, UIColor.yellow, UIColor.orange]
    var matchSet = [Int](repeating: -1, count: 6)
    var correctSet = [Int](repeating: -1, count: 6)
    var previousTap = -1
    var pregame = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Memory Game"
        self.newGame()
        // Do any additional setup after loading the view.
    }
    
    func checkSet() -> Int {
        for i in 0...5 {
            if(matchSet[i] == -1) {
                return 0
            }
        }
        return 1
    }
    
    func checkWin() -> Int {
        for i in 0...5 {
            if(correctSet[i] == -1) {
                return 0
            }
        }
        return 1
    }
    
    func checkMove(bNum: Int) {
        if(pregame == 1) {
            return
        }
        if(previousTap == -1) {
            previousTap = bNum
        }
        else {
            if(previousTap != bNum && matchSet[previousTap] == matchSet[bNum]) {
                print("correct match!")
                correctSet[bNum] = 1
                correctSet[previousTap] = 1
                showCorrect(bNum: bNum)
                showCorrect(bNum: previousTap)
                previousTap = -1
            }
            else {
                showWrong(bNum: previousTap)
                showWrong(bNum: bNum)
                previousTap = -1
                print("incorrect match")
            }
        }
        if(checkWin() == 1) {
            print("game over. you won!")
        }
    }
    
    @IBAction func b1Tap() {
        checkMove(bNum: 0)
    }
    
    @IBAction func b2Tap() {
        checkMove(bNum: 1)
    }
    
    @IBAction func b3Tap() {
        checkMove(bNum: 2)
    }

    @IBAction func b4Tap() {
        checkMove(bNum: 3)
    }
    
    @IBAction func b5Tap() {
        checkMove(bNum: 4)
    }
    
    @IBAction func b6Tap() {
        checkMove(bNum: 5)
    }
    
    func showWrong(bNum: Int) {
        if(bNum == 0) {
            gameButton1.backgroundColor = UIColor.red
            gameButton1.tintColor = UIColor.red
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                if(self.correctSet[0] == 1) {
                    self.gameButton1.backgroundColor = UIColor.green
                    self.gameButton1.tintColor = UIColor.green
                    return
                }
                self.gameButton1.backgroundColor = UIColor.gray
                self.gameButton1.tintColor = UIColor.gray
            }
        }
        if(bNum == 1) {
            gameButton2.backgroundColor = UIColor.red
            gameButton2.tintColor = UIColor.red
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                if(self.correctSet[1] == 1) {
                    self.gameButton2.backgroundColor = UIColor.green
                    self.gameButton2.tintColor = UIColor.green
                    return
                }
                self.gameButton2.backgroundColor = UIColor.gray
                self.gameButton2.tintColor = UIColor.gray
            }
        }
        if(bNum == 2) {
            gameButton3.backgroundColor = UIColor.red
            gameButton3.tintColor = UIColor.red
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                if(self.correctSet[2] == 1) {
                    self.gameButton3.backgroundColor = UIColor.green
                    self.gameButton3.tintColor = UIColor.green
                    return
                }
                self.gameButton3.backgroundColor = UIColor.gray
                self.gameButton3.tintColor = UIColor.gray
            }
        }
        if(bNum == 3) {
            gameButton4.backgroundColor = UIColor.red
            gameButton4.tintColor = UIColor.red
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                if(self.correctSet[3] == 1) {
                    self.gameButton4.backgroundColor = UIColor.green
                    self.gameButton4.tintColor = UIColor.green
                    return
                }
                self.gameButton4.backgroundColor = UIColor.gray
                self.gameButton4.tintColor = UIColor.gray
            }
        }
        if(bNum == 4) {
            gameButton5.backgroundColor = UIColor.red
            gameButton5.tintColor = UIColor.red
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                if(self.correctSet[4] == 1) {
                    self.gameButton5.backgroundColor = UIColor.green
                    self.gameButton5.tintColor = UIColor.green
                    return
                }
                self.gameButton5.backgroundColor = UIColor.gray
                self.gameButton5.tintColor = UIColor.gray
            }
        }
        if(bNum == 5) {
            gameButton6.backgroundColor = UIColor.red
            gameButton6.tintColor = UIColor.red
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                if(self.correctSet[5] == 1) {
                    self.gameButton6.backgroundColor = UIColor.green
                    self.gameButton6.tintColor = UIColor.green
                    return
                }
                self.gameButton6.backgroundColor = UIColor.gray
                self.gameButton6.tintColor = UIColor.gray
            }
        }
    }
    
    func showCorrect(bNum: Int) {
        if(bNum == 0) {
            gameButton1.backgroundColor = UIColor.green
            gameButton1.tintColor = UIColor.green
        }
        if(bNum == 1) {
            gameButton2.backgroundColor = UIColor.green
            gameButton2.tintColor = UIColor.green
        }
        if(bNum == 2) {
            gameButton3.backgroundColor = UIColor.green
            gameButton3.tintColor = UIColor.green
        }
        if(bNum == 3) {
            gameButton4.backgroundColor = UIColor.green
            gameButton4.tintColor = UIColor.green
        }
        if(bNum == 4) {
            gameButton5.backgroundColor = UIColor.green
            gameButton5.tintColor = UIColor.green
        }
        if(bNum == 5) {
            gameButton6.backgroundColor = UIColor.green
            gameButton6.tintColor = UIColor.green
        }
    }
    
    func hideColors() {
        gameButton1.backgroundColor = UIColor.gray
        gameButton1.tintColor = UIColor.gray
        gameButton2.backgroundColor = UIColor.gray
        gameButton2.tintColor = UIColor.gray
        gameButton3.backgroundColor = UIColor.gray
        gameButton3.tintColor = UIColor.gray
        gameButton4.backgroundColor = UIColor.gray
        gameButton4.tintColor = UIColor.gray
        gameButton5.backgroundColor = UIColor.gray
        gameButton5.tintColor = UIColor.gray
        gameButton6.backgroundColor = UIColor.gray
        gameButton6.tintColor = UIColor.gray
    }
    
    func setColors() {
        gameButton1.backgroundColor = colorSet[matchSet[0]]
        gameButton1.tintColor = colorSet[matchSet[0]]
        gameButton2.backgroundColor = colorSet[matchSet[1]]
        gameButton2.tintColor = colorSet[matchSet[1]]
        gameButton3.backgroundColor = colorSet[matchSet[2]]
        gameButton3.tintColor = colorSet[matchSet[2]]
        gameButton4.backgroundColor = colorSet[matchSet[3]]
        gameButton4.tintColor = colorSet[matchSet[3]]
        gameButton5.backgroundColor = colorSet[matchSet[4]]
        gameButton5.tintColor = colorSet[matchSet[4]]
        gameButton6.backgroundColor = colorSet[matchSet[5]]
        gameButton6.tintColor = colorSet[matchSet[5]]
    }
    
    func newGame() {
        for i in 0...5 {
            matchSet[i] = -1
            correctSet[i] = -1
        }
        previousTap = -1
        pregame = 1
        print(matchSet)
        var b1: Int
        var b2: Int
        var usedColors: Int
        usedColors = 0
        while(checkSet() == 0) {
            b1 = -1
            b2 = -1
            while(b1 == -1) {
                b1 = Int(arc4random_uniform(6))
                if(matchSet[b1] != -1) {
                    b1 = -1
                }
            }
            while(b2 == -1) {
                b2 = Int(arc4random_uniform(6))
                if(matchSet[b2] != -1 || b1 == b2) {
                    b2 = -1
                }
            }
            /*
            print(b1)
            print(b2)
            */
            matchSet[b1] = usedColors
            matchSet[b2] = usedColors
            print(matchSet)
            print("next iteration")
            usedColors = usedColors + 1
        }
        //print(matchSet)
        //print(usedColors)
        setColors()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.pregame = 0
            self.hideColors()
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

}
