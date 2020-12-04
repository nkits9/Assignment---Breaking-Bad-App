//
//  NetworkCharactersManager.swift
//  MVC-BreakingBadAPI
//
//  Created by MOHIT SHARMA on 04/12/20.
//

import UIKit
import SDWebImage

class CharacterInfoView: UIView {
    
    private lazy var stackView = update(UIStackView()) {
        $0.axis = .vertical
        $0.distribution = .equalSpacing
    }
    lazy var characterImageView = update(UIImageView()) {
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFit
        $0.backgroundColor = .systemBackground
        $0.sd_imageIndicator = SDWebImageActivityIndicator.whiteLarge
    }
    lazy var activityIndicator = update(UIActivityIndicatorView()) {
        $0.startAnimating()
        $0.style = .large
        $0.color = .systemOrange
    }
    private lazy var characterName = update(UILabel()) {
        $0.applyBBStyle()
    }
    private lazy var characterNickname = update(UILabel()) {
        $0.applyBBStyle()
        $0.textColor = .orange
    }
    private lazy var characterStatus = update(UILabel()) {
        $0.applyBBStyle()
    }
    private lazy var characterPortrayed = update(UILabel()) {
        $0.applyBBStyle()
        $0.textColor = .orange
    }
    private lazy var characterAppearance = update(UILabel()) {
        $0.applyBBStyle()
    }
    lazy var addToFavoriteButton = update(UIButton()) {
        $0.tintColor = .blue
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        _setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func _setupLayout() {

        stackView.addArrangedSubview(characterName)
        stackView.addArrangedSubview(characterNickname)
        stackView.addArrangedSubview(characterStatus)
        stackView.addArrangedSubview(characterPortrayed)
        stackView.addArrangedSubview(characterAppearance)
        
        addSubview(characterImageView, constraints: [
            equal(\.topAnchor, \.safeAreaLayoutGuide.topAnchor, constant: 20),
            equal(\.leadingAnchor, constant: 20),
            equal(\.trailingAnchor, constant: -20),
            equal(\.heightAnchor, constant: 300),
            equal(\.widthAnchor, constant: 150)
        ])
        
        addSubview(stackView, constraints: [
            equal(\.topAnchor, to: characterImageView, \.bottomAnchor, constant: 20),
            equal(\.leadingAnchor, constant: 20),
            equal(\.trailingAnchor, constant: -20),
            equal(\.heightAnchor, constant: 200)
        ])
        
        addSubview(addToFavoriteButton, constraints: [
            equal(\.bottomAnchor, \.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            equal(\.leadingAnchor, constant: 60),
            equal(\.trailingAnchor, constant: -60),
            equal(\.heightAnchor, constant: 50),
            equal(\.widthAnchor, constant: 50)
        ])
        
        addSubview(activityIndicator, constraints: [
            equal(\.centerYAnchor),
            equal(\.centerXAnchor)
        ])
    }
    
    func configureUIElements(with character: Character, favoriteList: FavoriteList) {
        characterName.text = character.name
        characterNickname.text = character.nickname
        characterStatus.text = character.status
        characterPortrayed.text = character.portrayed
        characterAppearance.text = "\(character.appearance)"
        characterImageView.sd_setImage(with: URL(string: character.img), placeholderImage: Images.placeholder)
        
        activityIndicator.stopAnimating()
        addToFavoriteButton.setImage(
            favoriteList.isFavorite(character: character) ? #imageLiteral(resourceName: "heartIcon") : #imageLiteral(resourceName: "unselectedHeart"),
            for: .normal
        )
    }
}
