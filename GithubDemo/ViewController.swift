//
//  ViewController.swift
//  GithubDemo
//
//  Created by Nhan Nguyen on 5/12/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, SettingsViewControllerDelegate {
    var searchBar: UISearchBar!
    var searchSettings = GithubRepoSearchSettings()
    
    var repos: [GithubRepo]!
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 136
        tableView.rowHeight = UITableViewAutomaticDimension
        
        
        // initialize UISearchBar
        searchBar = UISearchBar()
        searchBar.delegate = self
        
        // add search bar to navigation bar
        searchBar.sizeToFit()
        navigationItem.titleView = searchBar
        
        doSearch()
        
        tableView.delegate = self
        tableView.dataSource = self

        tableView.reloadData()
    }
    
    private func doSearch() {
        MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        GithubRepo.fetchRepos(searchSettings, successCallback: { (repos) -> Void in
            
            self.repos = repos
            
            for repo in repos {
                print("[Name: \(repo.name!)]" +
                    "\n\t[Stars: \(repo.stars!)]" +
                    "\n\t[Forks: \(repo.forks!)]")
                
                println("\n\t[Owner: \(repo.ownerHandle!)]" +
                    "\n\t[Description: \(repo.description!)]" +
                    "\n\t[Avatar: \(repo.ownerAvatarURL!)]")
            }
            
            self.tableView.reloadData()
            
            MBProgressHUD.hideHUDForView(self.view, animated: true)
        }, error: { (error) -> Void in
            println(error)
        })
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let repos = repos {
            return repos.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("RepoCell", forIndexPath: indexPath) as! RepoCell
        
        cell.nameLabel.text = repos[indexPath.row].name
        cell.descriptionLabel.text = repos[indexPath.row].description
        
        if let star = repos[indexPath.row].stars {
            cell.starLabel.text = String(star)
        }
        
        if let fork = repos[indexPath.row].forks {
            cell.forkLabel.text = String(fork)
        }
        
        cell.ownerLabel.text = repos[indexPath.row].ownerHandle
        
//        var url = NSURL(string: (repos[indexPath.row].ownerAvatarURL as? String)!)
        
        let url = NSURL(string: repos[indexPath.row].ownerAvatarURL!)
        
        cell.avatarView.setImageWithURL(url)
        
        return cell
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let navigationController = segue.destinationViewController as! UINavigationController
        let settingsViewController = navigationController.topViewController as! SettingsViewController
        
//        settingsViewController.delegate = self

    }
    
    
    
    func filtersViewController(filFiltersViewController: SettingsViewController, didUpdateFilters filters: [String : AnyObject]) {
        var star = filters["star"] as? Float
        
//        self.filters["star"] = star
        
//        Business.searchWithTerm(searchBar.text, sort: nil, categories: categories, deals: deal) { (businesses: [Business]!, error: NSError!) -> Void in
//            self.businesses = businesses
//            self.tableView.reloadData()
//        }
    }
    
    
}

extension ViewController: UISearchBarDelegate {
    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(true, animated: true)
        return true;
    }
    
    func searchBarShouldEndEditing(searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(false, animated: true)
        return true;
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchSettings.searchString = searchBar.text
        searchBar.resignFirstResponder()
        doSearch()
    }
}