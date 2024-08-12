//
//  FavouriteViewController.swift
//  MVVM-Architecture
//
//  Created by russel on 12/8/24.
//

import UIKit
import CoreData

class FavouriteViewController: UIViewController {

    var favouriteView = FavouriteView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationController?.navigationBar.topItem?.title = "My Favourites"
        
        let didSaveNotification = NSManagedObjectContext.didSaveObjectsNotification
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didNewEntrySaved),
                                               name: didSaveNotification,
                                               object: nil)
    }
    
    override func loadView() {
        self.view = favouriteView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupPresenter()
    }
    
    private func setupPresenter() {
        let presenter = FavouritePresenter(favouriteView: favouriteView)
        favouriteView.presenter = presenter
    }
    
    @objc func didNewEntrySaved() {
        favouriteView.presenter.getAllFavourites()
    }
}
