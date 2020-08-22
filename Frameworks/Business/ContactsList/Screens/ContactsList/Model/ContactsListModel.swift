//
//  ContactsListModel.swift
//  ContactsList
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import DataRepository
import DomainModels
import Foundation

protocol ContactsListModel: AnyObject {

    func observeContacts<ObserverType: AnyObject>(on observer: ObserverType, updates: @escaping (ObserverType, Result<[Contact], ContactsRepositoryError>) -> Void)

}
