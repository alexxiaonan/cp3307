//
//  Theme1GanmePlay.swift
//  MyPuzzleIOS
//
//  Created by xiaonan li on 14/5/16.
//  Copyright © 2016年 xiaonan li. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox
import CoreData

class Theme1GanmePlay: UIViewController {
   
    let sco = DataController().managedObjectContext
    
    
    @IBOutlet weak var btn1view: UIButton!
    @IBOutlet weak var btn2view: UIButton!
    @IBOutlet weak var btn3view: UIButton!
    @IBOutlet weak var btn4view: UIButton!
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
            btn1view.setImage(UIImage(named: "animal10"), forState: UIControlState.Normal)
        }
        if (count5 == 1){
            btn1view.setImage(UIImage(named: "animal20"), forState: UIControlState.Normal)
        }
        if (count5 == 2){
           btn1view.setImage(UIImage(named: "animal30"), forState: UIControlState.Normal)
        }
        print(count5)
 
            
        if (count6 == 0){
            btn2view.setImage(UIImage(named: "animal11"), forState: UIControlState.Normal)
        }
        if (count6 == 1){
            btn2view.setImage(UIImage(named: "animal21"), forState: UIControlState.Normal)
        }
        if (count6 == 2){
            btn2view.setImage(UIImage(named: "animal31"), forState: UIControlState.Normal)
        }
        print(count6)

            
        if (count7 == 0){
            btn3view.setImage(UIImage(named: "animal12"), forState: UIControlState.Normal)
        }
        if (count7 == 1){
            btn3view.setImage(UIImage(named: "animal22"), forState: UIControlState.Normal)
        }
        if (count7 == 2){
            btn3view.setImage(UIImage(named: "animal32"), forState: UIControlState.Normal)
        }
        print(count7)

          
        if (count8 == 0){
            btn4view.setImage(UIImage(named: "animal13"), forState: UIControlState.Normal)
        }
        if (count8 == 1){
            btn4view.setImage(UIImage(named: "animal23"), forState: UIControlState.Normal)
        }
        if (count8 == 2){
            btn4view.setImage(UIImage(named: "animal33"), forState: UIControlState.Normal)
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
    
    
    
    var timecountdog = " "
    var timecountlion = " "
    var timecountcat = " "
    func timesaccountScoredog(){
        let request = NSFetchRequest(entityName: "Score")
        do{
            let results = try sco.executeFetchRequest(request) as! [Score]
            for result in results{
                if ((result.name) == "dog"){
                    timecountdog = (result.times)!
                    print("xxxxxxxxxxxxxx",timecountdog)
                };savedata()
            }
        }catch{
            fatalError("something wrong:\(error)")
        }
    }
    func timesaccountScorelion(){
        let request = NSFetchRequest(entityName: "Score")
        do{
            let results = try sco.executeFetchRequest(request) as! [Score]
            for result in results{
                if ((result.name) == "lion"){
                    timecountlion = (result.times)!
                    print("xxxxxxxxxxxxxx",timecountlion)
                };savedata()
            }
        }catch{
            fatalError("something wrong:\(error)")
        }
    }
    func timesaccountScorecat(){
        let request = NSFetchRequest(entityName: "Score")
        do{
            let results = try sco.executeFetchRequest(request) as! [Score]
            for result in results{
                if ((result.name) == "cat"){
                    timecountcat = (result.times)!
                    print("xxxxxxxxxxxxxx",timecountcat)
                };savedata()
            }
        }catch{
            fatalError("something wrong:\(error)")
        }
    }

    
    func deleteScoredog(){
        let request = NSFetchRequest(entityName: "Score")
        do{
            let results = try sco.executeFetchRequest(request) as! [Score]
            for result in results{
                if ((result.name) == "dog"){
                    sco.deleteObject(result)
                };savedata()
            }
        }catch{
            fatalError("something wrong:\(error)")
        }
    }
    func deleteScorelion(){
        let request = NSFetchRequest(entityName: "Score")
        do{
            let results = try sco.executeFetchRequest(request) as! [Score]
            for result in results{
                if ((result.name) == "lion"){
                    sco.deleteObject(result)
                };savedata()
            }
        }catch{
            fatalError("something wrong:\(error)")
        }
    }
    func deleteScorecat(){
        let request = NSFetchRequest(entityName: "Score")
        do{
            let results = try sco.executeFetchRequest(request) as! [Score]
            for result in results{
                if ((result.name) == "cat"){
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
         
            var sound1 = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("dog", ofType:"mp3")!)
            var baseURL1 = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("dog", ofType:"mp3")! )
            AudioServicesCreateSystemSoundID(baseURL1, &soundID)
            AudioServicesPlaySystemSound(soundID)
            
            alertView.delegate = self
            alertView.title = "Congratulate!"
            alertView.message = "Play Again?"
            alertView.addButtonWithTitle("Yes!")
            alertView.addButtonWithTitle("No")
            alertView.cancelButtonIndex=0
            alertView.show()
            
            
            timesaccountScoredog()
            deleteScoredog()
            let a = (timecountdog as NSString).integerValue + 1
            let b:String = String(a)
            self.addScore("dog",time: nowDate, times:b)
            
            
           
         
        }
        else if (image1 == "2" && image2 == "2" && image3 == "2" && image4 == "2") {
            
            
            var soundID1: SystemSoundID = 1
            
            var sound2 = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("lion", ofType:"mp3")!)
            var baseURL2 = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("lion", ofType:"mp3")! )
            AudioServicesCreateSystemSoundID(baseURL2, &soundID1)
            AudioServicesPlaySystemSound(soundID1)

            
            alertView.delegate = self
            alertView.title = "Congratulate!"
            alertView.message = "Play Again?"
            alertView.addButtonWithTitle("Yes!")
            alertView.addButtonWithTitle("No")
            alertView.cancelButtonIndex=0
            alertView.show()
            
            timesaccountScorelion()
            deleteScorelion()
            let a = (timecountlion as NSString).integerValue + 1
            let b:String = String(a)
            self.addScore("lion",time: nowDate, times: b)

        }
        else if (image1 == "3" && image2 == "3" && image3 == "3" && image4 == "3") {
            
            var soundID2: SystemSoundID = 2
            
            var sound3 = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("cat", ofType:"mp3")!)
            var baseURL3 = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("cat", ofType:"mp3")! )
            AudioServicesCreateSystemSoundID(baseURL3, &soundID2)
            AudioServicesPlaySystemSound(soundID2)

            
            alertView.delegate = self
            alertView.title = "Congratulate!"
            alertView.message = "Play Again?"
            alertView.addButtonWithTitle("Yes!")
            alertView.addButtonWithTitle("No")
            alertView.cancelButtonIndex=0
            alertView.show()
            
           
            timesaccountScorecat()
            deleteScorecat()
            let a = (timecountcat as NSString).integerValue + 1
            let b:String = String(a)
            self.addScore("cat",time: nowDate, times: b)
        }
    }
    
    
    
    @IBAction func btnView1(sender: UIButton) {
        let count:Int = Int(arc4random_uniform(3))
        
        if (count == 0){
            sender.setImage(UIImage(named: "animal10"), forState: UIControlState.Normal)
            image1 = "1"
        }
        if (count == 1){
            sender.setImage(UIImage(named: "animal20"), forState: UIControlState.Normal)
            image1 = "2"
        }
        if (count == 2){
            sender.setImage(UIImage(named: "animal30"), forState: UIControlState.Normal)
            image1 = "3"
        }
        judge ()
        print(count)
    }

    @IBAction func btnView2(sender: AnyObject) {
        let count1:Int = Int(arc4random_uniform(3))
        
        if (count1 == 0){
            sender.setImage(UIImage(named: "animal11"), forState: UIControlState.Normal)
            image2 = "1"
        }
        if (count1 == 1){
            sender.setImage(UIImage(named: "animal21"), forState: UIControlState.Normal)
            image2 = "2"
        }
        if (count1 == 2){
            sender.setImage(UIImage(named: "animal31"), forState: UIControlState.Normal)
            image2 = "3"
        }
        judge ()
        print(count1)
    }

     @IBAction func btnView3(sender: AnyObject) {
        let count2:Int = Int(arc4random_uniform(3))
        
        if (count2 == 0){
            sender.setImage(UIImage(named: "animal12"), forState: UIControlState.Normal)
            image3 = "1"
        }
        if (count2 == 1){
            sender.setImage(UIImage(named: "animal22"), forState: UIControlState.Normal)
            image3 = "2"
        }
        if (count2 == 2){
            sender.setImage(UIImage(named: "animal32"), forState: UIControlState.Normal)
            image3 = "3"
        }
        judge ()
        print(count2)

     }
    
    
    @IBAction func btnView4(sender: AnyObject) {
        let count3:Int = Int(arc4random_uniform(3))
        
        if (count3 == 0){
            sender.setImage(UIImage(named: "animal13"), forState: UIControlState.Normal)
             image4 = "1"
        }
        if (count3 == 1){
            sender.setImage(UIImage(named: "animal23"), forState: UIControlState.Normal)
             image4 = "2"
        }
        if (count3 == 2){
            sender.setImage(UIImage(named: "animal33"), forState: UIControlState.Normal)
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
