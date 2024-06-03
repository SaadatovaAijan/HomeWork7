//
//  ViewController.swift
//  Lesson4.7
//
//  Created by Aijan Saadatova on 30/5/24.
//

import UIKit

class ViewController: UIViewController {
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let backBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let saladLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Salad"
        lbl.font = .systemFont(ofSize: 20, weight: .bold)
        lbl.textColor = .black
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let searchBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let collectionViewHorizontal: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 350, height: 130)
        layout.minimumLineSpacing = 30
        layout.minimumInteritemSpacing = 100
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    private let sortByLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Sort By"
        lbl.font = .systemFont(ofSize: 20, weight: .bold)
        lbl.textColor = .black
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let arrowSV: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fill
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private let mostPopularLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Most Popular"
        lbl.font = .systemFont(ofSize: 16, weight: .regular)
        lbl.textColor = .systemRed
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private let arrowUpImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "arrow.up")
        img.tintColor = UIColor.red
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private let arrowDownImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "arrow.down")
        img.tintColor = UIColor.red
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private let collectionViewVerticel: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 160, height: 250)
        layout.minimumLineSpacing = 15
        layout.minimumInteritemSpacing = 15
        layout.sectionInset = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    private func setupUI() {
        setupCollectionView()
        viewContainer()
        
        collectionViewHorizontal.dataSource = self
        collectionViewHorizontal.register(customHorizontalCollectionViewCell.self, forCellWithReuseIdentifier: "customCVCell")
        
        collectionViewVerticel.dataSource = self
        collectionViewVerticel.register(customVerticalCollectionViewCell.self, forCellWithReuseIdentifier: "verticalCVCell")
        
    }
    
    private func viewContainer() {
        view.addSubview(containerView)
        containerView.addSubview(backBtn)
        containerView.addSubview(saladLabel)
        containerView.addSubview(searchBtn)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 65),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            containerView.heightAnchor.constraint(equalToConstant: 40),
            
            backBtn.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            backBtn.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            backBtn.widthAnchor.constraint(equalToConstant: 20),
            backBtn.heightAnchor.constraint(equalToConstant: 20),
            
            saladLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            saladLabel.leadingAnchor.constraint(equalTo: backBtn.trailingAnchor, constant: 20),
            saladLabel.heightAnchor.constraint(equalToConstant: 30),
            
            searchBtn.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            searchBtn.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            searchBtn.widthAnchor.constraint(equalToConstant: 20),
            searchBtn.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionViewHorizontal)
        
        NSLayoutConstraint.activate([
            collectionViewHorizontal.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            collectionViewHorizontal.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionViewHorizontal.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionViewHorizontal.heightAnchor.constraint(equalToConstant: 130)
        ])
        
        view.addSubview(sortByLabel)
        
        NSLayoutConstraint.activate([
            sortByLabel.topAnchor.constraint(equalTo: collectionViewHorizontal.bottomAnchor, constant: 15),
            sortByLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            sortByLabel.heightAnchor.constraint(equalToConstant: 30),
            sortByLabel.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        view.addSubview(arrowSV)
        arrowSV.addArrangedSubview(mostPopularLabel)
        arrowSV.addArrangedSubview(arrowUpImage)
        arrowSV.addArrangedSubview(arrowDownImage)
        
        NSLayoutConstraint.activate([
            arrowSV.topAnchor.constraint(equalTo: collectionViewHorizontal.bottomAnchor, constant: 20),
            arrowSV.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            arrowSV.heightAnchor.constraint(equalToConstant: 20),
            arrowSV.widthAnchor.constraint(equalToConstant: 130)
        ])
        
        view.addSubview(collectionViewVerticel)
        
        NSLayoutConstraint.activate([
            collectionViewVerticel.topAnchor.constraint(equalTo: sortByLabel.bottomAnchor, constant: 15),
            collectionViewVerticel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionViewVerticel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionViewVerticel.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private var cotegories: [Content] = [
        Content(image: UIImage(resource: .salad),
                label: "Salad",
                amountRecipesLabel: "16,278 recipes",
                saladImage: UIImage(resource: .salad1),
                bookMarkImage: "bookmark.circle.fill",
                infoSaladLabel: "Vegetable and Fruit Green Salad",
                personImage: UIImage(resource: .person1),
                namePersonLabel: "George"),
        Content(image: UIImage(resource: .baking),
                label: "Baking",
                amountRecipesLabel: "10,005 recipes",
                saladImage: UIImage(resource: .salad2),
                bookMarkImage: "bookmark.circle",
                infoSaladLabel: "Vegetable & Fruit with Balsa...",
                personImage: UIImage(resource: .person2),
                namePersonLabel: "Jane Cooper"),
        Content(image: UIImage(resource: .fastFood),
                label: "Fast food",
                amountRecipesLabel: "289 recipes",
                saladImage: UIImage(resource: .salad3),
                bookMarkImage: "bookmark.circle",
                infoSaladLabel: "Vegetable and Fruit Green Salad",
                personImage: UIImage(resource: .person3),
                namePersonLabel: "Brad Wigington"),
        Content(image: UIImage(resource: .shashlik),
                label: "Shashlik",
                amountRecipesLabel: "378 recipes",
                saladImage: UIImage(resource: .salad4),
                bookMarkImage: "bookmark.circle.fill",
                infoSaladLabel: "Vegetable and Fruit Green Salad",
                personImage: UIImage(resource: .person4),
                namePersonLabel: "Aileen"),
        Content(image: UIImage(resource: .drink),
                label: "Drink",
                amountRecipesLabel: "20,308 recipes",
                saladImage: UIImage(resource: .salad5),
                bookMarkImage: "bookmark.circle.fill",
                infoSaladLabel: "Vegetable and Fruit Green Salad",
                personImage: UIImage(resource: .person5),
                namePersonLabel: "Tyra Ballentine"),
        Content(image: UIImage(resource: .drink),
                label: "Drink",
                amountRecipesLabel: "20,308 recipes",
                saladImage: UIImage(resource: .salad6),
                bookMarkImage: "bookmark.circle",
                infoSaladLabel: "Vegetable and Fruit Green Salad",
                personImage: UIImage(resource: .person6),
                namePersonLabel: "Marci Winkles"),
        Content(image: UIImage(resource: .drink),
                label: "Drink",
                amountRecipesLabel: "20,308 recipes",
                saladImage: UIImage(resource: .salad7),
                bookMarkImage: "bookmark.circle",
                infoSaladLabel: "Vegetable and Fruit Green Salad",
                personImage: UIImage(resource: .person7),
                namePersonLabel: "George"),
        Content(image: UIImage(resource: .drink),
                label: "Drink",
                amountRecipesLabel: "20,308 recipes",
                saladImage: UIImage(resource: .salad8),
                bookMarkImage: "bookmark.circle.fill",
                infoSaladLabel: "Vegetable and Fruit Green Salad",
                personImage: UIImage(resource: .person2),
                namePersonLabel: "Tyra Ballentine"),
        Content(image: UIImage(resource: .drink),
                label: "Drink",
                amountRecipesLabel: "20,308 recipes",
                saladImage: UIImage(resource: .salad9),
                bookMarkImage: "bookmark.circle",
                infoSaladLabel: "Vegetable and Fruit Green Salad",
                personImage: UIImage(resource: .person1),
                namePersonLabel: "Jane Cooper"),
        Content(image: UIImage(resource: .drink),
                label: "Drink",
                amountRecipesLabel: "20,308 recipes",
                saladImage: UIImage(resource: .salad10),
                bookMarkImage: "bookmark.circle.fill",
                infoSaladLabel: "Vegetable and Fruit Green Salad",
                personImage: UIImage(resource: .person1),
                namePersonLabel: "Jane Cooper"),
    ]
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == collectionViewHorizontal {
            return 5
        } else {
            return cotegories.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == collectionViewHorizontal {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCVCell", for: indexPath) as! customHorizontalCollectionViewCell
            let elemects = cotegories[indexPath.row]
            cell.setCustomCellData(with: elemects)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "verticalCVCell", for: indexPath) as! customVerticalCollectionViewCell
            let elements = cotegories[indexPath.row]
            cell.configure(with: elements)
            return cell
        }
        
    }
}
