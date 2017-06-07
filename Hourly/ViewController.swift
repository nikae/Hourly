//
//  ViewController.swift
//  Hourly
//
//  Created by Nika on 5/31/17.
//  Copyright © 2017 Nika. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var clockInBtn: UIButton!
    @IBOutlet weak var clockOutBtn: UIButton!
    @IBOutlet weak var manuallyButn: UIButton!
    @IBOutlet weak var addNewJobBtn: UIButton!
    
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var overalView: UIView!
    
    
    @IBOutlet weak var todaysDateLabel: UILabel!
    @IBOutlet weak var jobTitleLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var nextPayOutLabel: UILabel!
    @IBOutlet weak var nextPayOutDateLabel: UILabel!
    @IBOutlet weak var nextPayOutMoneyLabel: UILabel!
    @IBOutlet weak var lastPayOutLabel: UILabel!
    @IBOutlet weak var lastPayOutDateLabel: UILabel!
    @IBOutlet weak var lastPayOutMoneyLabel: UILabel!
    @IBOutlet weak var passedTotalLabel: UILabel!
    @IBOutlet weak var passedTotalDateLabel: UILabel!
    @IBOutlet weak var passedTotalMoney: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewShape(view: clockInBtn)
       // viewShedow(view: clockInBtn)
        
        viewShape(view: clockOutBtn)
        //viewShedow(view: clockOutBtn)
        
        viewShape(view: manuallyButn)
       // viewShedow(view: manuallyButn)
        
        viewShape(view: addNewJobBtn)
    
        viewShedow(view: headerView)
        viewShedow(view: overalView)
        
        addNewJobBtn.isHighlighted = true
        clockInBtn.isHighlighted = true
        clockOutBtn.isHighlighted = true
        manuallyButn.isHighlighted = true
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d, yyyy"
        let result = formatter.string(from: date)
        
        todaysDateLabel.text = result
        
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as UITableViewCell!
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as UICollectionViewCell!
        return cell
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func alertController(title: String, action: UIAlertAction) {
        let alertController = UIAlertController(title: title, message: "", preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) {
            (action: UIAlertAction) in
            
            print("You've pressed Cancel Button")
        }
        
        alertController.addAction(action)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }

    
    //Time managinhg for pace
    var zeroTime = TimeInterval()
    var timer : Timer = Timer()
    
    func updateTime() {
        let currentTime = NSDate.timeIntervalSinceReferenceDate
        var timePassed = currentTime - zeroTime
        let hours = UInt8(timePassed / 3600.0)
        timePassed -= (TimeInterval(hours) * 3600)
        let minutes = UInt8(timePassed / 60.0)
        timePassed -= (TimeInterval(minutes) * 60)
        let seconds = UInt8(timePassed)
        timePassed -= TimeInterval(seconds)
        //let millisecsX10 = UInt8(timePassed * 100)
        
        let strHours = String(format: "%02d", hours)
        let strMinutes = String(format: "%02d", minutes)
        let strSeconds = String(format: "%02d", seconds)
        //let strMSX10 = String(format: "%02d", millisecsX10)
        
        timerLabel.text = "\(strHours):\(strMinutes):\(strSeconds)"
    }

    @IBAction func clockInHit(_ sender: UIButton) {
        let oKAction = UIAlertAction(title: "OK", style: .default) {
            (action: UIAlertAction) in
           self.clockInBtn.isEnabled = false
            self.clockInBtn.backgroundColor = UIColor.white.withAlphaComponent(0.3)
            self.timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(ViewController.updateTime), userInfo: nil, repeats: true)
            self.zeroTime = NSDate.timeIntervalSinceReferenceDate
            //self.timeLabel.text = "00:00:00"
        }
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        let result = formatter.string(from: date)
        
        alertController(title: "Please Conform. \n Start time: \(result)", action: oKAction)
        
    }
    
    @IBAction func clockOutHit(_ sender: UIButton) {
        let oKAction = UIAlertAction(title: "OK", style: .default) {
            (action: UIAlertAction) in
            self.clockInBtn.isEnabled = true
            self.clockInBtn.backgroundColor = myGreen
            self.timer.invalidate()
            self.timerLabel.text = "00:00:00"
        }
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        let result = formatter.string(from: date)
        
        alertController(title: "Please Conform. \n End time: \(result)", action: oKAction)
    }
    
    @IBAction func manuallyHit(_ sender: UIButton) {
    }
    @IBAction func addNewJobHit(_ sender: UIButton) {
    }
    

}

