//
//  CategoriesViewController.swift
//  iOSTechnicalTest
//
//  Created by Emmanuel Valentín Granados López on 5/19/19.
//  Copyright © 2019 Emmanuel Valentín Granados López. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapOnPopularSection(_ sender: Any) {
        performSegue(withIdentifier: "segueResults", sender: "popular")
    }
    
    @IBAction func tapOnTopRatedSection(_ sender: Any) {
        performSegue(withIdentifier: "segueResults", sender: "top")
    }
    
    @IBAction func tapOnUpcomingSection(_ sender: Any) {
        performSegue(withIdentifier: "segueResults", sender: "upcoming")
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "segueResults" {
            if let tvcResults = segue.destination as? ResultsTableViewController {
                tvcResults.filter = sender as! String
            }
        }
    }

}
