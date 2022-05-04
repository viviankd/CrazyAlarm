//
//  GridViewController.swift
//  CrazyAlarm
//
//  Created by Vivian Duong on 4/4/22.
//

import UIKit

protocol GridViewControllerDatasource: AnyObject {
    var currentGuesses: [[Character?]] {get}
    func boxColor(at indexPath: IndexPath) -> UIColor? // store colors for boxes
    func winCheck(at indexParh: IndexPath) -> Bool
}

class GridViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate,
                          UICollectionViewDataSource {

    weak var datasource: GridViewControllerDatasource?
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0 // spacing in between keys
        let keyView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        keyView.translatesAutoresizingMaskIntoConstraints = false
        keyView.backgroundColor = .clear
        keyView.register(KeyboardCell.self, forCellWithReuseIdentifier: KeyboardCell.identifier)
        return keyView
    }()
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        // constrain the grid inside safe area
        NSLayoutConstraint.activate([collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
                                     collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
                                    collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
                                    collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                    ])
        
        view.backgroundColor = .purple
        
    }
    func updateGuess() {
        collectionView.reloadData()
    }

}

extension GridViewController {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return datasource?.currentGuesses.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let guesses = datasource?.currentGuesses ?? [] // get the current guess if not exist then get empty collection
        return guesses[section].count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KeyboardCell.identifier, for: indexPath) as? KeyboardCell else {
            fatalError()
        }
     
//       cell.configure(with: Character("A")) // add letters from Keycell to keyboard
        
       
    // cell designs
        cell.backgroundColor = datasource?.boxColor(at: indexPath) // get the color of the box after guesses
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.systemPink.cgColor
        let win = datasource?.winCheck(at: indexPath)
        if win == true {
            // DO THE SPECIAL FUNCTION
            UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
            print("you win mate")
        
        }
        // get the guesses from datasource and apply them to the grid
        let guesses = datasource?.currentGuesses ?? []
        if let letter = guesses[indexPath.section][indexPath.row] {
            if letter != "<" {
                cell.configure(with: letter)
//                print("added this char " + String(letter))
            }
       
        }
        return cell
    }
    // size of key boxes
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let margin: CGFloat = 20
        // divide by 5 because we have 5 letters
        let size: CGFloat = (collectionView.frame.size.width-margin)/5
       // square
        return CGSize(width: size, height: size)
    }
    
// vertical spacing
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

       return UIEdgeInsets(
           top: 2,
           left: 2,
           bottom: 2,
           right: 2
       )
   }


}

