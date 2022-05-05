//
//  WordleViewController.swift
//  CrazyAlarm
//
//  Created by Vivian Duong on 4/4/22.
//

import UIKit

var winner = false
class WordleViewController: UIViewController {
    
    let answerCollection = [ "fairy", "farts", "green", "ulcer", "lofty", "bloat", "girth", "round", "house"]
    var answer = ""
    // array of guesses. stores 6 guesses of 5 characters. Starts will nil values
    var guesses: [[Character?]] = Array(
        repeating: Array(repeating: nil, count: 5),
        count: 6
    )
    
    let keyboardViewController = KeyboardViewController()
    let gridViewController = GridViewController()
    override func viewDidLoad() {
        winner = false
        super.viewDidLoad()
        title = "Wordal"
        answer = answerCollection.randomElement() ?? "gross"
        print(answer)
        view.backgroundColor = .systemGray6
        addChildren()
    }
    
    private func addChildren() {
        addChild(keyboardViewController)
        
        keyboardViewController.didMove(toParent: self)
        keyboardViewController.delegate = self
        keyboardViewController.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(keyboardViewController.view)
        
        addChild(gridViewController)
        gridViewController.didMove(toParent: self)
        gridViewController.datasource = self
        gridViewController.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gridViewController.view)
        addConstraints()
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            gridViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                        gridViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                        gridViewController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                        gridViewController.view.bottomAnchor.constraint(equalTo: keyboardViewController.view.topAnchor),
                        gridViewController.view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),

                        keyboardViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                        keyboardViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                        keyboardViewController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
extension WordleViewController: KeyboardViewControllerDelegate {
    func keyboardViewController(_ vc: KeyboardViewController, didTapKey letter: Character) {
//        print("tapped letter " + String(letter))
        // update guesses in 2d array
        if winner == true {
            return
        }
        var stop = false //
        for i in 0..<guesses.count {
            for j in 0..<guesses[i].count {
                if guesses[i][j] == nil {
                    if letter == "<" { // backspace deletes prev character
                        if j > 0 {
                            guesses[i][j-1] = nil
//                            print("i " + String(i) + "j " + String(j))
                            
                        }
                        stop = true
                        break
                    } else { // add the letter to the guess array
                        guesses[i][j] = letter
                        stop = true
                        break
                    }
                }
                
            }
//            print("i " + String(i) + "j " + String(j))
            
            if guesses[5][4] != nil && winner == false {
                print("LOSER")
                for v in 0..<guesses.count {
                    for n in 0..<guesses[i].count {
                        guesses[v][n] = nil
                    }
                }
            }
            if stop {
                break
            }
        }
        gridViewController.updateGuess()
    }
}

// updates guesses
extension WordleViewController: GridViewControllerDatasource {
    var currentGuesses: [[Character?]] {
        return guesses
    }
    
    // set the box colors based on the guess
    func boxColor(at indexPath: IndexPath) -> UIColor? {
        let rowIndex = indexPath.section
        
        let count = guesses[rowIndex].compactMap({ $0 }).count
        guard count == 5 else {
            return nil
        }
        
        
        let indexedAnswer = Array(answer) // indexing answer by letter
        guard let letter = guesses[indexPath.section][indexPath.row],
              indexedAnswer.contains(letter) else {
            return .systemGray // if the letter is not in the word at all
        }
        
        if indexedAnswer[indexPath.row] == letter {
            return .systemGreen // if the letter is in the right place
        }
        return .systemYellow // if the letter is in the answer
    }
    
    func winCheck(at indexPath: IndexPath) -> Bool {
        let rowIndex = indexPath.section
        
        let count = guesses[rowIndex].compactMap({ $0 }).count
        guard count == 5 else {
            return false
        }
        print("answer " + answer)
//        print(guesses[rowIndex])
        var winCount = 0
        let indexedAnswer = Array(answer)
//        print("indexed answer " + String(indexedAnswer))
        for i in 0..<5{
            if indexedAnswer[i] == guesses[rowIndex][i] {
//                print(guesses[rowIndex][i])
//                print(String(indexedAnswer[i]))
                winCount = winCount + 1
            }
        }
        print("wincount " + String(winCount))
        if winCount == 5 {
            print("WINNER")
            winner = true
            return true
        } else {
            winCount = 0
        }
        return false
    }
}
