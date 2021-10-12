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
        
    }

    

}
