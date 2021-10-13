//
//  DataBaseManager.swift
//  quickePost
//
//  Created by Md Maruf Prodhan on 12/10/21.
//

import Foundation
import FirebaseFirestore

final class DatabaseManager {
    static let shared  = DatabaseManager()
    
    private let database = Firestore.firestore()
    private init(){}
    public func intser(
        blogPost:BlogPost,
        user:String,
        completion:@escaping(Bool)->Void
    )
    {
    
        
    }
    
    public func getAllPost(
        completion:@escaping([BlogPost])->Void
    )
    {
    
        
    }
    public func gePost(
        forUser:User,
        completion:@escaping([BlogPost])->Void
    )
    {
    
        
    }
    public func inser(
        user:User,
        completion:@escaping(Bool)->Void
    )
    {
    
        
    }
}

