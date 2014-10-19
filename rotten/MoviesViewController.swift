//
//  MoviesViewController.swift
//  rotten
//
//  Created by Dianna on 9/26/14.
//  Copyright (c) 2014 dianna. All rights reserved.
//
//
// http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=8ktrgn7b6cascgfahzqrwh3m&limit=20&country=us
//let YourApiKey = "8ktrgn7b6cascgfahzqrwh3m" // Fill with the key you registered at http://developer.rottentomatoes.com
//let RottenTomatoesURLString = "http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=" + YourApiKey
//let request = NSMutableURLRequest(URL: NSURL.URLWithString(RottenTomatoesURLString))
//NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler:{ (response, data, error) in
//    var errorValue: NSError? = nil
//    let dictionary = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &errorValue) as NSDictionary
//    })


import UIKit

class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    
    @IBOutlet var tableView: UITableView!
    var movies: [NSDictionary] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Display a default or loading view
        
        var url = "http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=8ktrgn7b6cascgfahzqrwh3m&limit=20&country=us"
        var request = NSURLRequest(URL: NSURL(string: url))
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue())
            { (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
                
                // Hide the loading view
                
                var object = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as NSDictionary
                self.movies = object["movies"] as [NSDictionary]
                
                // println("Made the network call and here's the movies: \(self.movies)  ")
                
                self.tableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        println("In tableView-numberOfRows function, movie count = \(movies.count) ")
        return movies.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->
        UITableViewCell {
            println("In tableView-cellForRow function, movie count = \(movies.count) ")
            println("I'm at row: \(indexPath.row), section: \(indexPath.section)")

            var cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as MovieCell
            
            println("cell: \(cell) ")
            
            var movie = self.movies[indexPath.row]
            
            println("In tableView-cellForRow function, movie = \(movie) ")
            
            cell.titleLabel.text = movie["title"] as? String
            cell.synopsisLabel.text = movie["synopsis"] as? String
            
            var posters = movie["posters"] as NSDictionary
            var posterUrl = posters["thumbnail"] as String
            
            cell.posterView.setImageWithURL(NSURL(string: posterUrl))
            
         // println("Current indexpath row:\(indexPath.row), title: \(cell.titleLabel.text)")
            
            return cell
    }
    
    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
