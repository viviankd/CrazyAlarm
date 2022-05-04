//
//  KeyboardViewController.swift
//  CrazyAlarm
//
//  Created by Vivian Duong on 4/4/22.
//
// set up the
import UIKit

protocol KeyboardViewControllerDelegate: AnyObject {
    func keyboardViewController(_ vc: KeyboardViewController, didTapKey letter: Character)
}
class KeyboardViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate,
                              UICollectionViewDataSource {

    weak var delegate: KeyboardViewControllerDelegate?
    
    let letters = ["qwertyuiop", "asdfghjkl", "zxcvbnm<"]
    private var keys: [[Character]] = []
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 2 // spacing in between keys
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
        view.backgroundColor = .purple
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                    collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                    collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
                                    collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                    ])
        // add letters from keyboard to array of characters
        for row in letters {
            let chars = Array(row)
            keys.append(chars)
        }
        
    }

}

extension KeyboardViewController {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return keys.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return keys[section].count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KeyboardCell.identifier, for: indexPath) as? KeyboardCell else {
           fatalError()
       }
       let letter = keys[indexPath.section][indexPath.row]
       cell.configure(with: letter) // add letters from Keycell to keyboard
       return cell
    }
    
    // size of key boxes
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let margin: CGFloat = 20
        let size: CGFloat = (collectionView.frame.size.width-margin)/10

        return CGSize(width: size, height: size*1.5)
    }
        
    // vertical spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        let margin: CGFloat = 20
        let size: CGFloat = (collectionView.frame.size.width-margin)/10
        let count: CGFloat = CGFloat(collectionView.numberOfItems(inSection: section))

        let inset: CGFloat = (collectionView.frame.size.width - (size * count) - (2 * count))/2
    // center the keys per row
        return UIEdgeInsets(
            top: 2,
            left: inset,
            bottom: 2,
            right: inset
        )
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       //
        collectionView.deselectItem(at: indexPath, animated: true) // unhighlight
        let letter = keys[indexPath.section][indexPath.row] // letter that was pressed
        delegate?.keyboardViewController(self, didTapKey: letter)
//           print("letter pressed: " + String(letter))
   }
}
