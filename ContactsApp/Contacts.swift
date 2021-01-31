//
//  ViewController.swift
//  ContactsApp
//
//  Created by user on 31.01.2021.
//  Copyright © 2021 user. All rights reserved.
//

import UIKit

struct Contacts{
    var name: String
}

let cellId = "ContactCell"

class ContactsVC: UITableViewController {
    
    var contacts = [Contacts(name: "Full")]

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Contacts"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addContact))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = contacts[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contact = contacts[indexPath.row].name
        let controller = AddContactVC()
        controller.name = contact
        controller.completion = { name in
            self.contacts[indexPath.row].name = name
            self.tableView.reloadData()
        }
        present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
    }
    
    @objc func addContact(){
        let controller = AddContactVC()
        controller.completion = { name in
            self.contacts.append(Contacts(name: name))
            self.tableView.reloadData()
        }
        present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
    }
}

