//
//  AddContactVC.swift
//  ContactsApp
//
//  Created by user on 31.01.2021.
//  Copyright © 2021 user. All rights reserved.
//

import UIKit

class AddContactVC: UIViewController {
    
    var completion: ((String) -> Void)?
    var name = ""
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Введите контакт"
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(saveData))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismissVC))
        view.addSubview(textField)
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textField.text = name
    }
    
    @objc func saveData(){
        if let text = textField.text, textField.hasText{
            completion!(text)
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc func dismissVC(){
        self.dismiss(animated: true, completion: nil)
    }

}
