//
//  HomepageVc.swift
//  Fast_Food
//
//  Created by sudhir on 19/05/21.
//

import UIKit

class DashboardViewController: UIViewController {
    
    let tableViewCellHeight = 130.0
    override class func description() -> String {
        return "DashboardViewController"
    }

    let sideBar      = SideBarViewController()
    let transition   = SideBarAnimation()
    var topView      : UIView?
    let data         : [String] = ["donuts","burger","noodel","pasta","pizza","donuts","burger","noodel","pasta","pizza"]
    
    var hotelDetails: [HotelDetails] = []
    
//    MARK: OUTLETS
    @IBOutlet weak var ibTvSearchBar        : UITextField!
    @IBOutlet weak var ibOfferCollection    : UICollectionView!
    @IBOutlet weak var ibHotelListTable     : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSearchbar()
        configureCollectionView()
        collectionViewDelegateSet()
        tableViewDelegateSet()
        setArrayHotelList()
        configureNavigationBar()
        configureCustomCell()
        
        sideBar.delegate  = self  //sideBar Table delegate
        
        
        //set SideBar Swipe gesture
        transition.tapGesture = {
            self.sideBar.dismiss(animated: true, completion: nil)
            print("remove sidebar")
        }
        
        
        let rightSwipeGesture = UISwipeGestureRecognizer(
            target: self,
            action: #selector(didTapSideBarMenuBtn))
        rightSwipeGesture.direction = .right //default direction is also right
        view.addGestureRecognizer(rightSwipeGesture)
    }
    
    //tableView Nib Register
    private func configureCustomCell(){
        ibHotelListTable.separatorStyle = .none
        ibHotelListTable.register(
            UINib(nibName: "CellTableViewHome",bundle: nil),
            forCellReuseIdentifier: "cell")
    }
    
    private func configureSearchbar(){
        ibTvSearchBar?.layer.cornerRadius     = ibTvSearchBar.frame.size.height * 0.3
        ibTvSearchBar?.clipsToBounds          = true
        ibTvSearchBar?.layer.borderWidth      = 1.0
        ibTvSearchBar?.layer.backgroundColor  = UIColor.black.cgColor
        ibTvSearchBar?.tintColor              = UIColor.black
        ibTvSearchBar?._IconBtn(
            image: UIImage(systemName: "magnifyingglass"),
            space: 10, direction: "Left",width: 30,height: 30)
    }
    //configure navigation bar
    private func configureNavigationBar(){
        navigationItem.title = "FastFood"
        navigationItem.leftBarButtonItem =
            UIBarButtonItem(
                image: UIImage(systemName: "list.dash"),
                style: .done,
                target: self,
                action: #selector(didTapSideBarMenuBtn)
            )
        
        navigationItem.rightBarButtonItem =
            UIBarButtonItem(image: UIImage(systemName: "cart"),
                            style: .done,
                            target: self,
                            action: #selector(didTapCartBtn)
            )
        navigationItem.rightBarButtonItem?.tintColor = .black
        navigationItem.leftBarButtonItem?.tintColor  = .black
    }
    @objc
    func didTapSideBarMenuBtn(){
        //sideBarViewController present style
        sideBar.modalPresentationStyle  = .overCurrentContext
        //transitionDelegate
        sideBar.transitioningDelegate   = self
        present(sideBar, animated: true)
        
    }
    @objc
    func didTapCartBtn(){
        let vc = storyboard?.instantiateViewController(
            withIdentifier: "CartViewController")as! CartViewController
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    //configure collection view
    private func configureCollectionView(){
        ibOfferCollection?.layer.cornerRadius = 10
        ibOfferCollection?.clipsToBounds      = true
    }
   //table view dataSource and  Delegate
    private func tableViewDelegateSet(){
        ibHotelListTable?.dataSource          = self
        ibHotelListTable?.delegate            = self
    }
    //Mark:  InnerView offer CollectionView Delegate and DataSource
    private func collectionViewDelegateSet(){
        ibOfferCollection?.delegate           = self
        ibOfferCollection?.dataSource         = self
    }
    
    
    //static data
    private func setArrayHotelList(){
        
        hotelDetails.append(
            HotelDetails(
                image: UIImage(named: "HotelMadhuri"),
                hotelNama: "Pradhyum",hotelType: "Veg",
                hotelAddress: "2-A,Balash,\nDholka-382225")
        )
        
        hotelDetails.append(
            HotelDetails(image: UIImage(named: "Hotel_sarover_portico"),
                         hotelNama: "Shree Nath", hotelRating: "5.0",
                         hotelType: "Veg",
                         hotelAddress: "23-S,Dholka-kheda Road,\nDholka-382225")
        )
        
        hotelDetails.append(
            HotelDetails(
                image: UIImage(named: "amrutfalhotelandrestaurant"),
                hotelNama: "Punjabi Tadka", hotelRating: "5.0",
                hotelType: "Veg",
                hotelAddress: "32-S,Kalikund,\nDholka-382225")
        )
        hotelDetails.append(HotelDetails(image: UIImage(named: "cherries_restaurant"), hotelNama: "cherries_restaurant Tadka", hotelRating: "5.0", hotelType: "Veg", hotelAddress: "32-S,Kalikund,\nDholka-382225"))
        }
}

//MARK: TableView
extension DashboardViewController:
    UITableViewDataSource,
    UITableViewDelegate{
    //data source
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
      
        return hotelDetails.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                     for: indexPath)as! CellTableViewHome
            cell.dataBind(hotelData: hotelDetails[indexPath.row])
            return cell
        
    }
    //delegate
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {

            print("home: \(indexPath)")
            let obj  = hotelDetails[indexPath.row]
            let vc   =
                UIStoryboard(name: "food_categories", bundle: nil)
                .instantiateViewController(withIdentifier:FoodCategoriesViewController.identifier)as! FoodCategoriesViewController
            vc.title = obj.hotelNama
            navigationController?
                .pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(tableViewCellHeight)
    }
}



