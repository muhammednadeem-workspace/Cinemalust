//
//  DashBoardViewController.swift
//  Cinemalust
//
//  Created by Muhammed Nadeem on 30/08/22.
//  Copyright © 2022 Genysis.inc. All rights reserved.
//

import UIKit
import Lottie

class DashBoardViewController: UIViewController {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var profileBttn: UIButton!
    @IBOutlet weak var notificationIcon: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var animationView: AnimationView!
    
    var dashboardList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyles()
        setData()
        registerCell()
        lottieAnimation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        lottieAnimation()
    }
    
    override func viewDidLayoutSubviews() {
        profileView.clipsToBounds = true
    }
    
    func setStyles(){
        profileView.layer.cornerRadius = profileView.frame.height / 2
        tableView.backgroundColor = UIColor.black
    }
    
    private func setData(){
        if let userName = USER_DEFAULTS.string(forKey: "username"){
            self.nameLbl.text = userName
        }
        profileBttn.addTarget(self, action: #selector(viewProfile), for: .touchUpInside)
        dashboardList = DashboardModel.dashBoardList()
    }
    
    private func lottieAnimation(){
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 0.5
        animationView.play()
    }
    
    @objc func viewProfile(){
        let profileVC = mainStoryboard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        self.navigationController?.pushViewController(profileVC, animated: true)
    }
    
    private func registerCell(){
        tableView.register(UINib(nibName: "HeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "HeaderTableViewCell")
        tableView.register(UINib(nibName: "PopularListTableViewCell", bundle: nil), forCellReuseIdentifier: "PopularListTableViewCell")
    }

}

//MARK: TableView Delegate and Data soucrce
extension DashBoardViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dashboardList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableCell = dashboardList[indexPath.row]
        
        if tableCell == "HeaderTableViewCell"{
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell", for: indexPath) as! HeaderTableViewCell
            cell.onClickSearch = { value in
                print(value)
            }
            return cell
        }else if tableCell == "PopularListTableViewCell"{
            let cell = tableView.dequeueReusableCell(withIdentifier: "PopularListTableViewCell", for: indexPath) as! PopularListTableViewCell
            cell.filmListArray = ["sample01", "sample02", "sample03", "sample04", "sample06", "sample07"]
            cell.onClick = { value in
                print(value)
            }
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let tableCell = dashboardList[indexPath.row]
        switch tableCell{
        case "HeaderTableViewCell":
            return 110
        case "PopularListTableViewCell":
            return 220
        default:
            return 0
        }
    }
}
