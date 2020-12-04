//
//  NetworkCharactersManager.swift
//  MVC-BreakingBadAPI
//
//  Created by MOHIT SHARMA on 04/12/20.
//
import UIKit

class CustomDataSource<SectionType: Hashable, ItemType: Hashable>: UITableViewDiffableDataSource<SectionType, ItemType> {
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
