//
//  ViewController.swift
//  ContactsParsing
//
//  Created by Chunsu Kim on 29/09/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit
import Contacts

class ViewController: UIViewController {
    
    private let contactsTableView = UITableView()
    
    private var contactStore = CNContactStore()
    private var contacts = [ContactsStruct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTableView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        contactStore.requestAccess(for: .contacts) { (success, error) in
            if success {
                print("주소록에 접근 했습니다.")
            }
        }
        fetchContacts()
    }
    
    private func createTableView() {
        contactsTableView.dataSource = self
        contactsTableView.delegate = self
        contactsTableView.rowHeight = UITableView.automaticDimension
        contactsTableView.register(ContactsTableViewCell.self, forCellReuseIdentifier: ContactsTableViewCell.identifier)
        
        view.addSubview(contactsTableView)
        
        contactsTableView.translatesAutoresizingMaskIntoConstraints = false
        contactsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        contactsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        contactsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        contactsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
    
    private func fetchContacts() {
        let key = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey] as [CNKeyDescriptor]
        let request = CNContactFetchRequest(keysToFetch: key)
        contactStore.requestAccess(for: .contacts) { (success, error) in
            if success {
                do {
                    try! self.contactStore.enumerateContacts(with: request) { (contact, stop) in
                        let name = contact.givenName
                        let familyName = contact.familyName
                        var number: String
                        if contact.phoneNumbers.isEmpty {
                            number = "번호가 없습니다."
                        } else {
                            number = (contact.phoneNumbers.first?.value.stringValue)!
                        }
                        let contactsToAppend = ContactsStruct(givenName: name, familyName: familyName, number: number)
                        self.contacts.append(contactsToAppend)
                    }
                }
            } else {
                let toast = UIAlertController(title: "알림", message: "빠른 번호 설정을 위해 주소록에 접근이 필요합니다.", preferredStyle: .alert)
                toast.addAction(UIAlertAction(title: "확인", style: .default, handler: { (Action) -> Void in
                    let settingURL = NSURL(string: UIApplication.openSettingsURLString)! as URL
                    UIApplication.shared.open(settingURL, options: [:], completionHandler: nil)
                }))
                self.present(toast, animated: true, completion: nil)
            }
        }
        contactsTableView.reloadData()
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContactsTableViewCell.identifier, for: indexPath) as! ContactsTableViewCell
        let contactToDisplay = contacts[indexPath.row]
//        cell.nameLabel.text = contactToDisplay.givenName + "" + contactToDisplay.familyName
        cell.inputData(name: contactToDisplay.givenName + "" + contactToDisplay.familyName)
        
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    
}
