//
//  CVCollectionViewCell.swift
//  Lesson4.7
//
//  Created by Aijan Saadatova on 30/5/24.
//

import UIKit

class customHorizontalCollectionViewCell: UICollectionViewCell {
    
    private let cellImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 16
        return imageView
    }()
    
    private let saladLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let amountRecipesLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .green
        contentView.layer.cornerRadius = 12
        
        contentView.addSubview(cellImage)
        addSubview(saladLabel)
        addSubview(amountRecipesLabel)
        
        NSLayoutConstraint.activate([
        cellImage.topAnchor.constraint(equalTo: contentView.topAnchor),
        cellImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        cellImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        cellImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        
        saladLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 70),
        saladLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
        saladLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
        
        amountRecipesLabel.topAnchor.constraint(equalTo: saladLabel.bottomAnchor, constant: 8),
        amountRecipesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
        amountRecipesLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
        ])
    }
    
    func setCustomCellData(with elements: Content) {
        cellImage.image = elements.image
        saladLabel.text = elements.label
        amountRecipesLabel.text = elements.amountRecipesLabel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
