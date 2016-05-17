//
//  Theme2GamePlay.swift
//  MyPuzzleIOS
//
//  Created by xiaonan li on 16/5/16.
//  Copyright © 2016年 xiaonan li. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox
import CoreData


class Theme2GamePlay: UIViewController {

    let sco = DataController().managedObjectContext
    
    @IBOutlet weak var btn1View: UIButton!
    @IBOutlet weak var btn2View: UIButton!
    @IBOutlet weak var btn3View: UIButton!
    @IBOutlet weak var btn4View: UIButton!
    var image1 = ""
    var image2 = ""
    var image3 = ""
    var image4 = ""
    var audioPlayer1 = AVAudioPlayer()
    var audioPlayer2 = AVAudioPlayer()
    var audioPlayer3 = AVAudioPlayer()
    
    var nowDate: NSDate = NSDate()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnStart(sender: AnyObject) {
        let count5:Int = Int(arc4random_uniform(3))
        let count6:Int = Int(arc4random_uniform(3))
        let count7:Int = Int(arc4random_uniform(3))
        let count8:Int = Int(arc4random_uniform(3))
        
        if count8 != count7 || count7 != count6 || count6 != count5 {
            
            
            if (count5 == 0){
                btn1View.setImage(UIImage(named: "view10"), forState: UIControlState.Normal)
            }
            if (count5 == 1){
                btn1View.setImage(UIImage(named: "view20"), forState: UIControlState.Normal)
            }
            if (count5 == 2){
                btn1View.setImage(UIImage(named: "view30"), forState: UIControlState.Normal)
            }
            print(count5)
            
            
            if (count6 == 0){
                btn2View.setImage(UIImage(named: "view21"), forState: UIControlState.Normal)
            }
            if (count6 == 1){
                btn2View.setImage(UIImage(named: "view21"), forState: UIControlState.Normal)
            }
            if (count6 == 2){
                btn2View.setImage(UIImage(named: "view31"), forState: UIControlState.Normal)
            }
            print(count6)
            
            
            if (count7 == 0){
                btn3View.setImage(UIImage(named: "view12"), forState: UIControlState.Normal)
            }
            if (count7 == 1){
                btn3View.setImage(UIImage(named: "view22"), forState: UIControlState.Normal)
            }
            if (count7 == 2){
                btn3View.setImage(UIImage(named: "view32"), forState: UIControlState.Normal)
            }
            print(count7)
            
            
            if (count8 == 0){
                btn4View.setImage(UIImage(named: "view13"), forState: UIControlState.Normal)
            }
            if (count8 == 1){
                btn4View.setImage(UIImage(named: "view23"), forState: UIControlState.Normal)
            }
            if (count8 == 2){
                btn4View.setImage(UIImage(named: "view33"), forState: UIControlState.Normal)
            }
            print(count8)
            
        }

    }
    
    
    
    var alertView = UIAlertView()
    
    func alertView(alertView:UIAlertView, clickedButtonAtIndex buttonIndex: Int){
        if(buttonIndex==alertView.cancelButtonIndex){
            showScore()
            self.performSegueWithIdentifier("win", sender: self)
        }
        else
        {
            self.performSegueWithIdentifier("again", sender: self)
        }
    }
    
    
    
    
    
    func showScore(){
        let request = NSFetchRequest(entityName: "Score")
        do{
            let results = try sco.executeFetchRequest(request) as! [Score]
            for result in results{
                print(result.name, result.time, result.times)
            }
        }catch{
            fatalError("something wrong:\(error)")
        }
    }
    
    
    
    var timecounthouse = " "
    var timecountfair = " "
    var timecounttree = " "
    func timesaccountScorehouse(){
        let request = NSFetchRequest(entityName: "Score")
        do{
            let results = try sco.executeFetchRequest(request) as! [Score]
            for result in results{
                if ((result.name) == "house"){
                    timecounthouse = (result.times)!
                    print("xxxxxxxxxxxxxx",timecounthouse)
                };savedata()
            }
        }catch{
            fatalError("something wrong:\(error)")
        }
    }
    func timesaccountScorefair(){
        let request = NSFetchRequest(entityName: "Score")
        do{
            let results = try sco.executeFetchRequest(request) as! [Score]
            for result in results{
                if ((result.name) == "fair"){
                    timecountfair = (result.times)!
                    print("xxxxxxxxxxxxxx",timecountfair)
                };savedata()
            }
        }catch{
            fatalError("something wrong:\(error)")
        }
    }
    func timesaccountScoretree(){
        let request = NSFetchRequest(entityName: "Score")
        do{
            let results = try sco.executeFetchRequest(request) as! [Score]
            for result in results{
                if ((result.name) == "tree"){
                    timecounttree = (result.times)!
                    print("xxxxxxxxxxxxxx",timecounttree)
                };savedata()
            }
        }catch{
            fatalError("something wrong:\(error)")
        }
    }
    
    
    func deleteScorehouse(){
        let request = NSFetchRequest(entityName: "Score")
        do{
            let results = try sco.executeFetchRequest(request) as! [Score]
            for result in results{
                if ((result.name) == "house"){
                    sco.deleteObject(result)
                };savedata()
            }
        }catch{
            fatalError("something wrong:\(error)")
        }
    }
    func deleteScorefair(){
        let request = NSFetchRequest(entityName: "Score")
        do{
            let results = try sco.executeFetchRequest(request) as! [Score]
            for result in results{
                if ((result.name) == "fair"){
                    sco.deleteObject(result)
                };savedata()
            }
        }catch{
            fatalError("something wrong:\(error)")
        }
    }
    func deleteScoretree(){
        let request = NSFetchRequest(entityName: "Score")
        do{
            let results = try sco.executeFetchRequest(request) as! [Score]
            for result in results{
                if ((result.name) == "tree"){
                    sco.deleteObject(result)
                };savedata()
            }
        }catch{
            fatalError("something wrong:\(error)")
        }
    }
    
    
    func savedata(){
        
        do{
            try self.sco.save()
        } catch{
            fatalError("failure to save context:\(error)")
        }
        
    }
    
    func addScore(name: String, time: NSDate , times: String){
        
        let entity = NSEntityDescription.insertNewObjectForEntityForName("Score", inManagedObjectContext: self.sco) as! Score
        
        entity.name = name
        entity.time = time
        entity.times = times
        
        savedata()
        
    }
    
    func judge (){
        if (image1 == "1" && image2 == "1" && image3 == "1" && image4 == "1") {
            
            var soundID: SystemSoundID = 0
            
            var sound1 = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("house", ofType:"mp3")!)
            var baseURL1 = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("house", ofType:"mp3")! )
            AudioServicesCreateSystemSoundID(baseURL1, &soundID)
            AudioServicesPlaySystemSound(soundID)
            
            alertView.delegate = self
            alertView.title = "Congratulate!"
            alertView.message = "Play Again?"
            alertView.addButtonWithTitle("Yes!")
            alertView.addButtonWithTitle("No")
            alertView.cancelButtonIndex=0
            alertView.show()
            
            
            timesaccountScorehouse()
            deleteScorehouse()
            let a = (timecounthouse as NSString).integerValue + 1
            let b:String = String(a)
            self.addScore("house",time: nowDate, times:b)
            
            
            
            
        }
        else if (image1 == "2" && image2 == "2" && image3 == "2" && image4 == "2") {
            
            
            var soundID1: SystemSoundID = 1
            
            var sound2 = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("fair", ofType:"mp3")!)
            var baseURL2 = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("fair", ofType:"mp3")! )
            AudioServicesCreateSystemSoundID(baseURL2, &soundID1)
            AudioServicesPlaySystemSound(soundID1)
            
            
            alertView.delegate = self
            alertView.title = "Congratulate!"
            alertView.message = "Play Again?"
            alertView.addButtonWithTitle("Yes!")
            alertView.addButtonWithTitle("No")
            alertView.cancelButtonIndex=0
            alertView.show()
            
            timesaccountScorefair()
            deleteScorefair()
            let a = (timecountfair as NSString).integerValue + 1
            let b:String = String(a)
            self.addScore("fair",time: nowDate, times: b)
            
        }
        else if (image1 == "3" && image2 == "3" && image3 == "3" && image4 == "3") {
            
            var soundID2: SystemSoundID = 2
            
            var sound3 = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("tree", ofType:"mp3")!)
            var baseURL3 = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("tree", ofType:"mp3")! )
            AudioServicesCreateSystemSoundID(baseURL3, &soundID2)
            AudioServicesPlaySystemSound(soundID2)
            
            
            alertView.delegate = self
            alertView.title = "Congratulate!"
            alertView.message = "Play Again?"
            alertView.addButtonWithTitle("Yes!")
            alertView.addButtonWithTitle("No")
            alertView.cancelButtonIndex=0
            alertView.show()
            
            
            timesaccountScoretree()
            deleteScoretree()
            let a = (timecounttree as NSString).integerValue + 1
            let b:String = String(a)
            self.addScore("tree",time: nowDate, times: b)
        }
    }
    
    

    
    
    
   
    @IBAction func btnView1(sender: AnyObject) {
        let count:Int = Int(arc4random_uniform(3))
        
        if (count == 0){
            sender.setImage(UIImage(named: "view10"), forState: UIControlState.Normal)
            image1 = "1"
        }
        if (count == 1){
            sender.setImage(UIImage(named: "view20"), forState: UIControlState.Normal)
            image1 = "2"
        }
        if (count == 2){
            sender.setImage(UIImage(named: "view30"), forState: UIControlState.Normal)
            image1 = "3"
        }
        judge ()
        print(count)
    }

    @IBAction func btnView2(sender: AnyObject) {
        let count1:Int = Int(arc4random_uniform(3))
        
        if (count1 == 0){
            sender.setImage(UIImage(named: "view11"), forState: UIControlState.Normal)
            image2 = "1"
        }
        if (count1 == 1){
            sender.setImage(UIImage(named: "view21"), forState: UIControlState.Normal)
            image2 = "2"
        }
        if (count1 == 2){
            sender.setImage(UIImage(named: "view31"), forState: UIControlState.Normal)
            image2 = "3"
        }
        judge ()
        print(count1)

    }
    
    @IBAction func btnView3(sender: AnyObject) {
        let count2:Int = Int(arc4random_uniform(3))
        
        if (count2 == 0){
            sender.setImage(UIImage(named: "view12"), forState: UIControlState.Normal)
            image3 = "1"
        }
        if (count2 == 1){
            sender.setImage(UIImage(named: "view22"), forState: UIControlState.Normal)
            image3 = "2"
        }
        if (count2 == 2){
            sender.setImage(UIImage(named: "view32"), forState: UIControlState.Normal)
            image3 = "3"
        }
        judge ()
        print(count2)

    }
    
    @IBAction func btnView4(sender: AnyObject) { let count3:Int = Int(arc4random_uniform(3))
        
        if (count3 == 0){
            sender.setImage(UIImage(named: "view13"), forState: UIControlState.Normal)
            image4 = "1"
        }
        if (count3 == 1){
            sender.setImage(UIImage(named: "view23"), forState: UIControlState.Normal)
            image4 = "2"
        }
        if (count3 == 2){
            sender.setImage(UIImage(named: "view33"), forState: UIControlState.Normal)
            image4 = "3"
        }
        judge ()
        print(count3)
        

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
