//
//  ResultsTableViewController.swift
//  iOSTechnicalTest
//
//  Created by Emmanuel Valentín Granados López on 5/19/19.
//  Copyright © 2019 Emmanuel Valentín Granados López. All rights reserved.
//

import UIKit

class ResultsTableViewController: UITableViewController {
    
    var filter = ""
    let request = Request.sharedInstance
    var content: [[String : AnyObject]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        setupDetailTableViewCell()
        httpRequest()
    }
    
    internal func setupDetailTableViewCell() {
        self.tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil),
                                forCellReuseIdentifier: "MovieTableViewCell")
    }
    
    internal func httpRequest() {
        request.performAsync(onSuccess: { (responseBody) in
            guard let jsonBody = responseBody as? [String : AnyObject]
                else {
                    return
            }
            if let results = jsonBody["results"] as? [[String : AnyObject]] {
                for result in results {
                    self.content.append(result)
                }
                self.tableView.reloadData()
            }
            
        }) { (error) in
            debugPrint(error)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return content.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as! MovieTableViewCell
        
        cell.lblMovieName.text = content[indexPath.row] ["title"] as? String
        
        if let rating = content[indexPath.row] ["vote_average"] as? Double {
            cell.lblVoteAverage.text = String(rating)
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segueDetails", sender: indexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45.0
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "segueDetails" {
            if let vcDetail = segue.destination as? DetailViewController {
                if let row = sender as? Int {
                    vcDetail.contentDetail = self.content[row]
                }
            }
        }
    }

}
