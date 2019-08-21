//
//  DownloadedSongController.swift
//  AppleMusic
//
//  Created by Hao Wu on 19.08.19.
//  Copyright © 2019 Hao Wu. All rights reserved.
//

import UIKit
import CoreData

class DownloadedSongController: UITableViewController {
    
    private struct Constants {
        static let SongCellHeight: CGFloat = 80
    }
    var dataController: DataController!
    var dataScource = DownloadedSongDataSource(songs: [])
    // TODO: - After coredata replace stub data
    var songs:[SongEntity] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Downloaded Songs"
        dataScource.update(with: songs)
        tableView.dataSource = dataScource
        
        let fetchRequest: NSFetchRequest<SongEntity> = SongEntity.fetchRequest()
        let sortDescription = NSSortDescriptor(key: "creationDate", ascending: false)
        fetchRequest.sortDescriptors = [sortDescription]
        
        if let result = try? dataController.viewContext.fetch(fetchRequest) {
            songs = result
            tableView.reloadData()
        }
    
    }

    // MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.SongCellHeight
    }

}
