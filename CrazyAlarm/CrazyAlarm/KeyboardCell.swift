//
//  KeyboardCell.swift
//  CrazyAlarm
//
//  Created by Vivian Duong on 4/4/22.
//

import UIKit

class KeyboardCell: UICollectionViewCell {
    static let identifier = "keyboardCell"
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .medium)
//        label.font = UIFont.fontNames(forFamilyName: Arial)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemPink
        contentView.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
    }
    func configure(with letter: Character){
        label.text = String(letter).uppercased()
    }
}
