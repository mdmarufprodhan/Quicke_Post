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
    private var user : User?
    
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
        setUpTableHeader()
        fetchProfileData()
        title = "Profile"
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
    private func setUpTableHeader(profilePhotoRef: String? = nil , name : String? = nil){
        let headerView  = UIView(frame:CGRect(x: 0, y: 0, width: view.width, height: view.width/1.5))
        headerView.backgroundColor = .systemBlue
        headerView.isUserInteractionEnabled = true
        headerView.clipsToBounds = true
        tableView.tableHeaderView = headerView
        //Profile picture
        let profilePhoto = UIImageView(image: UIImage(systemName:"person.circle"))
        profilePhoto.tintColor = .white
        profilePhoto.contentMode = .scaleAspectFit
        profilePhoto.frame  = CGRect(
            x:(view.width-(view.width/4))/2,
            y :(headerView.height-(view.width/4))/2.5,
            width: view.width/4,
            height: view.width/4
        )
        profilePhoto.isUserInteractionEnabled = true
        headerView.addSubview(profilePhoto)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTabProfilePhoto))
        profilePhoto.addGestureRecognizer(tap)
        //Name
        //Email
        let emailLabel = UILabel(frame: CGRect(x: 20, y: profilePhoto.bottom+10, width: view.width-40, height: 100))
        headerView.addSubview(emailLabel)
        emailLabel.text = currentEmail
        emailLabel.textAlignment = .center
        emailLabel.textColor = .white
        emailLabel.font = .systemFont(ofSize: 25,weight : .bold)
        
        if let name = name {
            title = name
        }
        if let ref = profilePhotoRef {
            //Fetch image here
        }
    }
     @objc private func didTabProfilePhoto(){
         guard let myEmail = UserDefaults.standard.string(forKey: "email") ,
         myEmail == currentEmail else{
             return
         }
         let picker  = UIImagePickerController()
         picker.sourceType = .photoLibrary
         picker.delegate = self
         picker.allowsEditing = true
         present(picker , animated: true)
            
        }
    
    private func fetchProfileData(){
        DatabaseManager.shared.getUser(email: currentEmail) {[weak self] user in
            guard let user = user else {
                return
            }
            self?.user  = user
            DispatchQueue.main.async {
                self?.setUpTableHeader(
                    profilePhotoRef: user.profilePicturRef,
                    name: user.name
                )

            }
        }
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
extension ProfileViewController : UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image  = info[.editedImage] as? UIImage  else {
            return
        }
        StroageManager.shared.uploadUserProfilePicture(email: currentEmail, image: image) { succes in
            
        }
    }
}
