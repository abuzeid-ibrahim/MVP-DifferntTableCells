//
//  UsersPresenter.swift
//  GenericOrEnumOrProtocolSolution
//
//  Created by Abuzeid Ibrahim on 11/4/18.
//  Copyright © 2018 abuzeid. All rights reserved.
//

import UIKit
protocol UsersView {
    func setUser(user:UserDataModel)
    
}


final class UsersPresenter {
    
    var view:UsersView?
    
    func attach(view:UsersView){
        self.view = view;
    }
    
   
    func loadData(userType:UserTypes){
        self.view?.setUser(user: getUserData(user: userType))
    }
    
    func getCellId(user:UserTypes)->String{
        switch user {
        case .privateUser:
            return PrivateUserTableCell.id
        case .goldUser:
            return GoldUserTableCell.id
        case .guestUser:
            return PublicUserTableCell.id
        }
    }
    
    
    
}

private extension UsersPresenter{
     func getUserData(user:UserTypes)->UserDataModel{
        switch user {
            
        case .privateUser:
            return PrivateUserViewModel(posts: 10, name: "Ali")
        case .goldUser:
            return GoldUserViewModel(posts: 100, name: "Hossam")
        case .guestUser:
            return GuestUserViewModel(posts: 1, name: "Farouk")
        }
    }
    
}
