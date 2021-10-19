//
//  ProfileViewController.swift
//  quickePost
//
//  Created by Md Maruf Prodhan on 12/10/21.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    //Profile photo
    
    //Full name
    
    //Email
    //List of posts
    
    private var tableView : UITableView = {
       let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    let currentEmail : String
    init(currentEmail : String) {
        self.currentEmail = currentEmail
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUpSignOutButton()
        setUpTable()
        title = currentEmail
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func setUpTable(){
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    //SignOut
    private func setUpSignOutButton(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Sign Out",
            style: .done,
            target: self,
            action: #selector(didTabSignOut)
        )
    }
    
    @objc func didTabSignOut(){
        let sheet = UIAlertController(title: "Sign Out", message: "Are you sure you'd like to sign out?", preferredStyle: .actionSheet)
        sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        sheet.addAction(UIAlertAction(title: "Sign Out", style: .destructive, handler: { _ in
            AuthManager.shared.signOut {[weak self] succes in
                if succes{
                    DispatchQueue.main.async {
                        UserDefaults.standard.set(nil,forKey: "email")
                        UserDefaults.standard.set(nil, forKey: "name")
                        let signInVC  = SignInViewController()
                        signInVC.navigationItem.largeTitleDisplayMode = .always
                        let navVC = UINavigationController(rootViewController: signInVC)
                        navVC.navigationBar.prefersLargeTitles = true
                        navVC.modalPresentationStyle = .fullScreen
                        navVC.navigationBar.prefersLargeTitles = true
                        self?.present(navVC, animated: true, completion: nil)
                    }
                }
                
            }
        }))
        
        present(sheet, animated: true)
        
    }
    //TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Blog post goes here!"
        return cell
}
    
    
}
