//
//  WordleViewController.swift
//  CrazyAlarm
//
//  Created by Vivian Duong on 5/2/22.
//

import UIKit

// UI
// Keyboard
// colors
class WordleViewController: UIViewController {
    let keyboardViewController = KeyboardViewController()
    let gridViewController = GridViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Wordal"
        view.backgroundColor = .systemGray6
        addChildren()
        // Do any additional setup after loading the view.
    }
    private func addChildren() {
        addChild(keyboardViewController)
        keyboardViewController.didMove(toParent: self)
        keyboardViewController.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(keyboardViewController.view)
        
        addChild(gridViewController)
        gridViewController.didMove(toParent: self)
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
