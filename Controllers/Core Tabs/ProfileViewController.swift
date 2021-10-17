//
//  ProfileViewController.swift
//  quickePost
//
//  Created by Md Maruf Prodhan on 12/10/21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .done, target: self, action: #selector(didTabSignOut)
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
}

