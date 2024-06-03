//
//  customCollectionViewCell.swift
//  Lesson4.7
//
//  Created by Aijan Saadatova on 2/6/24.
//

import UIKit

class customVerticalCollectionViewCell: UICollectionViewCell {
    
    private let cellImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 16
        return imageView
    }()
    
    private let bookMarkBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.tintColor = .red
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 15
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let infoSaladLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let personView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let personImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let namePersonLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        contentView.addSubview(cellImage)
        addSubview(bookMarkBtn)
        addSubview(infoSaladLabel)
        addSubview(personView)
        personView.addSubview(personImage)
        personView.addSubview(namePersonLabel)
        
        NSLayoutConstraint.activate([
        cellImage.topAnchor.constraint(equalTo: contentView.topAnchor),
        cellImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        cellImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        cellImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        
        bookMarkBtn.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
        bookMarkBtn.widthAnchor.constraint(equalToConstant: 30),
        bookMarkBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
        bookMarkBtn.heightAnchor.constraint(equalToConstant: 30),
        
        infoSaladLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 170),
        infoSaladLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
        infoSaladLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
        
        personView.topAnchor.constraint(equalTo: infoSaladLabel.bottomAnchor, constant: 5),
        personView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
        personView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        personView.heightAnchor.constraint(equalToConstant: 20),
        
        personImage.topAnchor.constraint(equalTo: personView.topAnchor),
        personImage.bottomAnchor.constraint(equalTo: personView.bottomAnchor),
        personImage.leadingAnchor.constraint(equalTo: personView.leadingAnchor),
        personImage.widthAnchor.constraint(equalToConstant: 20),
        
        namePersonLabel.topAnchor.constraint(equalTo: personView.topAnchor),
        namePersonLabel.bottomAnchor.constraint(equalTo: personView.bottomAnchor),
        namePersonLabel.leadingAnchor.constraint(equalTo: personImage.trailingAnchor, constant: 10),
        namePersonLabel.trailingAnchor.constraint(equalTo: personView.trailingAnchor),

        ])
    }
    
    func configure(with elements: Content) {
        cellImage.image = elements.saladImage
        bookMarkBtn.setImage(UIImage(systemName: elements.bookMarkImage), for: .normal)
        infoSaladLabel.text = elements.infoSaladLabel
        personImage.image = elements.personImage
        namePersonLabel.text = elements.namePersonLabel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
