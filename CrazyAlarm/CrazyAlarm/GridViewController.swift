//
//  GridViewController.swift
//  CrazyAlarm
//
//  Created by Vivian Duong on 5/2/22.
//

import UIKit

class GridViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate,
                          UICollectionViewDataSource {


    var guesses: [[Character?]] = Array(
        repeating: Array(repeating: nil, count: 5),
        count: 6
    )

let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.minimumInteritemSpacing = 2 // spacing in between keys
    let keyView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    keyView.translatesAutoresizingMaskIntoConstraints = false
    keyView.backgroundColor = .clear
//        keyView.backgroundColor = .yellow
    keyView.register(KeyboardCell.self, forCellWithReuseIdentifier: KeyboardCell.identifier)
    return keyView
}()
override func viewDidLoad() {
    
    super.viewDidLoad()
    collectionView.delegate = self
    collectionView.dataSource = self
    view.addSubview(collectionView)
    NSLayoutConstraint.activate([collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                                collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                                collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
                                collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                ])
    
    view.backgroundColor = .purple
}

}

extension GridViewController {
func numberOfSections(in collectionView: UICollectionView) -> Int {
       return guesses.count
   }

   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return guesses[section].count
   }

   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KeyboardCell.identifier, for: indexPath) as? KeyboardCell else {
           fatalError()
       }
     
//       cell.configure(with: Character("A")) // add letters from Keycell to keyboard
       cell.backgroundColor = nil
       cell.layer.borderWidth = 1
       cell.layer.borderColor = UIColor.systemGray3.cgColor
       return cell
   }
// size of key boxes
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

       let margin: CGFloat = 20
       let size: CGFloat = (collectionView.frame.size.width-margin)/5

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

   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       //
//           collectionView.deselectItem(at: indexPath, animated: true)
//           let letter = keys[indexPath.section][indexPath.row]
//           delegate?.keyboardViewController(self,
//                                            didTapKey: letter)
   }
}

