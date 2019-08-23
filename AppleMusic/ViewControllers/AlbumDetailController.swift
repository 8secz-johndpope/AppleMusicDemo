//
//  AlbumDetailController.swift
//  AppleMusic
//
//  Created by Hao Wu on 26.07.19.
//  Copyright © 2019 Hao Wu. All rights reserved.
//

import UIKit

class AlbumDetailController: UITableViewController {
    
    var dataSource = AlbumDetailDataSource(songs: [])
    
    var dataController: DataController!
    
    var album: Album? {
        didSet {
            if let album = album {
                artworkView.image = album.artwork
                self.title = album.name
                configure(with: album)
                dataSource.update(with: album.songs, imageData: album.artworkData)
                tableView.reloadData()
            }
        }
    }
    
    @IBOutlet weak var artworkView: UIImageView!
    @IBOutlet weak var albumTitleLabel: UILabel!
    @IBOutlet weak var albumGenreTitle: UILabel!
    @IBOutlet weak var albumReleaseDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource.dataController = dataController
        
        tableView.dataSource = dataSource
        
        if let album = album {
            configure(with: album)
        }
    }

    func configure(with album: Album) {
        let viewModel = AlbumDetailViewModel(album: album)
        
        albumTitleLabel.text = viewModel.title
        albumGenreTitle.text = viewModel.genre
        albumReleaseDateLabel.text = viewModel.releaseDate
    }

}
