//
//  PayWallViewController.swift
//  quickePost
//
//  Created by Md Maruf Prodhan on 13/10/21.
//

import UIKit

class PayWallViewController: UIViewController {
    //Pricing
    //CTA Buttons
    // Terms of service
    private let header = PayWallHeaderView()
    private let buyButton : UIButton = {
    let button = UIButton()
        button.setTitle("Subscribe", for:.normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        return button
        
    } ()
    private let restoreButton : UIButton = {
    let button = UIButton()
        button.setTitle("Restore Purchases", for:.normal)
        button.setTitleColor(.link, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        return button
        
    } ()
    //Terms of services
    
    private let termsView : UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.textAlignment = .center
        textView.textColor = .secondaryLabel
        textView.font = .systemFont(ofSize: 14)
        textView.text = "This is an auto-renewable Subscription. It will be charged to your iTunes account before each pay period. You can cancel anytime by going into your Settings > Subscriptions. Restore purchases if previously subscribed."
        
        return textView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Thoughts premium"
        view.backgroundColor = .systemBackground
        view.addSubview(header)
        view.addSubview(buyButton)
        view.addSubview(restoreButton)
        view.addSubview(termsView)
        setUpButton()
        setUpCloseButton()
    }
    //Terms of services
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        header.frame = CGRect(
            x: 0,
            y: view.safeAreaInsets.top,
            width: view.width,
            height: view.height/3.2
        )
        termsView.frame = CGRect(
            x: 10,
            y: view.height-100,
            width: view.width-20,
            height: 100
        )
        restoreButton.frame = CGRect(
            x: 25,
            y: termsView.top-70,
            width: view.width-50,
            height: 50
        )
        buyButton.frame = CGRect(
            x: 25,
            y: restoreButton.top-60,
            width: view.width-50,
            height: 50
        )
    }
    
    
    private func setUpButton(){
        buyButton.addTarget(self, action: #selector(didTabSubscribe), for: .touchUpInside)
        restoreButton.addTarget(self, action: #selector(didTabRestore), for: .touchUpInside)

        
    }
    @objc private func didTabSubscribe(){
        //Revenue cart
    }
    
    @objc private func didTabRestore(){
        //Revenue cart
    }
    
    private func setUpCloseButton(){
        navigationItem.rightBarButtonItem = UIBarButtonItem (
            barButtonSystemItem: .close,
            target: self,
            action: #selector(didTabClose)
        )
    }
    
    
    @objc private func didTabClose(){
        dismiss(animated: true, completion: nil)
    }
    
}
