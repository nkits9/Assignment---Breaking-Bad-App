//
//  NetworkCharactersManager.swift
//  MVC-BreakingBadAPI
//
//  Created by MOHIT SHARMA on 04/12/20.
//
import UIKit

class SearchVC: UIViewController {
    
    private var characterInfoView: SearchInfoView {
        view as! SearchInfoView
    }
    
    override func loadView() {
        view = SearchInfoView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        characterInfoView.searchCharacterButton.addTarget(self, action: #selector(pushCharacterInfoVC), for: .touchUpInside)
        characterInfoView.showAllCharacteButton.addTarget(self, action: #selector(pushCharactersListVC), for: .touchUpInside)
        characterInfoView.characterTextField.delegate = self
        createAndSetDismissKeyboardTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        characterInfoView.characterTextField.text = ""
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func createAndSetDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    @objc private func pushCharacterInfoVC() {
        guard let text = characterInfoView.characterTextField.text else { return }
        let request = SearchRequest(characterName: text)
        if request.isValid {
            presentAlert(title: AlertTitle.oops, message: AlertMessage.withoutName, buttonTitle: "ОК")
            return
        }
        let characterInfoVC = CharacterInfoVC(searchRequest: request)
        navigationController?.pushViewController(characterInfoVC, animated: true)
    }
    
    @objc private func pushCharactersListVC() {
        let charactersListVC = CharactersVC()
        navigationController?.pushViewController(charactersListVC, animated: true)
    }
}

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushCharacterInfoVC()
        characterInfoView.characterTextField.resignFirstResponder()
        return true
    }
}
