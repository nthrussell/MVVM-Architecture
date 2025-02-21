//
//  HomeViewController.swift
//  MVVM-Architecture
//
//  Created by russel on 12/8/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    var homeView: HomeView!
    var viewModel: HomeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationController?.navigationBar.topItem?.title = "Pokedex"
    }
    
    override func loadView() {
        viewModel = HomeViewModel()
        homeView = HomeView(viewModel: viewModel)
        self.view = homeView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigate()
    }
    
    func navigate() {
        homeView.onTap = { [weak self] url in
            guard let self = self else { return }
            let vc = DetailViewController(url: url)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
