//
//  RecordViewController.swift
//  MyPuzzleIOS
//
//  Created by xiaonan li on 16/5/16.
//  Copyright © 2016年 xiaonan li. All rights reserved.
//

import UIKit
import CoreData
class RecordViewController: UIViewController,UITableViewDataSource{

    
    @IBOutlet weak var tableView: UITableView!
    var scores = [NSManagedObject]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scores.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        
        let scoreitem = scores[indexPath.row]
        cell.textLabel!.text = scoreitem.valueForKey("name") as! String
        return cell
    }
       /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
        
 

}
