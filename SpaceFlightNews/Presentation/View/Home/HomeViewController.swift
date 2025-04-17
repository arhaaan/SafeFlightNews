//
//  HomeViewController.swift
//  SpaceFlightNews
//
//  Created by Karim Arhan on 15/04/25.
//

import UIKit

class HomeViewController: UIViewController {

   @IBOutlet weak var greetingsLabel: UILabel!
   @IBOutlet weak var tableView: UITableView!
   
   override func viewDidLoad() {
        super.viewDidLoad()

      tableView.register(UINib(nibName: "ArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "ArticleTableViewCell")
      tableView.dataSource = self
      tableView.delegate = self
      
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 3
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as! ArticleTableViewCell
      
      
      
      return cell
   }
   
}
