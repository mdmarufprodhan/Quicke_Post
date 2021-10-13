//
//  StroageManager.swift
//  quickePost
//
//  Created by Md Maruf Prodhan on 12/10/21.
//

import Foundation
import FirebaseStorage

final class StroageManager {
    static let shared  = StroageManager()
    
    private let container = Storage.storage().reference()
    
    private init(){}
    
    public func uploadUserProfilePicture(
        email:String,
        image: UIImage?,
        completion: @escaping(Bool)->Void
    ){
        
    }
    
    public func downloadUrlForProfilePicture(
        user:User,
        completion:@escaping(URL)->Void
    ){
        
    }
    
    public func uploadBlogHeaderImage(
        blogPost : BlogPost,
        image : UIImage?,
        completion:@escaping(Bool)->Void
    ){
        
    }
    public func downloadForPostHeader(
        blogPost:BlogPost ,
        completion:@escaping(URL?)->Void
    ){
        
    }
    
    
}
 
