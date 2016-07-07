//
//  ViewController.swift
//  EventTracker
//
//  Created by Andrew Bancroft on 5/4/15.
//  Copyright (c) 2015 Andrew Bancroft. All rights reserved.
//

import UIKit
import EventKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CalendarAddedDelegate {
	
    @IBOutlet weak var needPermissionView: UIView!
    @IBOutlet weak var calendarsTableView: UITableView!
    
    var calendars: [EKCalendar]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
		checkCalendarAuthorizationStatus()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewWillAppear(animated: Bool) {
		checkCalendarAuthorizationStatus()
    }
	
    func checkCalendarAuthorizationStatus() {
        let status = EKEventStore.authorizationStatusForEntityType(EKEntityType.Event)
        
        switch (status) {
        case EKAuthorizationStatus.NotDetermined:
            // This happens on first-run
            requestAccessToCalendar()
        case EKAuthorizationStatus.Authorized:
            // Things are in line with being able to show the calendars in the table view
            loadCalendars()
            refreshTableView()
        case EKAuthorizationStatus.Restricted, EKAuthorizationStatus.Denied:
            // We need to help them give us permission
            needPermissionView.fadeIn()
        }
    }
    
    func requestAccessToCalendar() {
        EKEventStore().requestAccessToEntityType(EKEntityType.Event, completion: {
            (accessGranted: Bool, error: NSError?) in
            
            if accessGranted == true {
                dispatch_async(dispatch_get_main_queue(), {
                    self.loadCalendars()
                    self.refreshTableView()
                })
            } else {
                dispatch_async(dispatch_get_main_queue(), {
                    self.needPermissionView.fadeIn()
                })
            }
        })
    }
    
    func loadCalendars() {
		self.calendars = EKEventStore().calendarsForEntityType(EKEntityType.Event).sort() { (cal1, cal2) -> Bool in
			return cal1.title < cal2.title
		}
    }
    
    func refreshTableView() {
        calendarsTableView.hidden = false
        calendarsTableView.reloadData()
    }
    
    @IBAction func goToSettingsButtonTapped(sender: UIButton) {
        let openSettingsUrl = NSURL(string: UIApplicationOpenSettingsURLString)
        UIApplication.sharedApplication().openURL(openSettingsUrl!)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let calendars = self.calendars {
            return calendars.count
        }
        
        return 0
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("basicCell")!
        
        if let calendars = self.calendars {
            let calendarName = calendars[indexPath.row].title
            cell.textLabel?.text = calendarName
        } else {
            cell.textLabel?.text = "Unknown Calendar Name"
        }
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
            case SegueIdentifiers.showAddCalendarSegue:
                let destinationVC = segue.destinationViewController as! UINavigationController
                let addCalendarVC = destinationVC.viewControllers[0] as! AddCalendarViewController
                addCalendarVC.delegate = self
            case SegueIdentifiers.showEventsSegue:
//                let destinationVC = segue.destinationViewController as! UINavigationController
                let eventsVC = segue.destinationViewController as! EventsViewController
                let selectedIndexPath = calendarsTableView.indexPathForSelectedRow!
                
                eventsVC.calendar = calendars?[selectedIndexPath.row]
            default: break
            }
        }
    }
    
	// MARK: Calendar Added Delegate
	func calendarDidAdd() {
		self.loadCalendars()
		self.refreshTableView()
	}
   
    ///////////////////////////////////////////////////////////////
    
    var deletePlanetIndexPath: NSIndexPath? = nil
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            
            deletePlanetIndexPath = indexPath
            
            let planetToDelete = calendars![indexPath.row]
            
            confirmDelete(planetToDelete)
            
        }
        
    }
    
    // Delete Confirmation and Handling
    
    func confirmDelete(planet: EKCalendar) {
        
        let alert = UIAlertController(title: "Delete Planet", message: "Are you sure you want to permanently delete \(planet.title)?", preferredStyle: .ActionSheet)
        
        
        let DeleteAction = UIAlertAction(title: "Delete", style: .Destructive, handler: handleDeletePlanet)
        
        let CancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: cancelDeletePlanet)
        

        alert.addAction(DeleteAction)
        
        alert.addAction(CancelAction)
        
        
        
        // Support presentation in iPad
        
        alert.popoverPresentationController?.sourceView = self.view
        
        alert.popoverPresentationController?.sourceRect = CGRectMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0, 1.0, 1.0)
        
        
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    
    
    func handleDeletePlanet(alertAction: UIAlertAction!) -> Void {
        
        
        if let indexPath = deletePlanetIndexPath {
            calendarsTableView.beginUpdates()
            
            calendars!.removeAtIndex(indexPath.row)
            
            calendarsTableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            
            
            deletePlanetIndexPath = nil
            
            calendarsTableView.endUpdates()
        }
        
    }
    
    
    
    func cancelDeletePlanet(alertAction: UIAlertAction!) {
        
        deletePlanetIndexPath = nil
        
    }
}

