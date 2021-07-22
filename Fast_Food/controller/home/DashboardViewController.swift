//
//  HomepageVc.swift
//  Fast_Food
//
//  Created by sudhir on 19/05/21.
//

import UIKit

class DashboardViewController: UIViewController {
    
    override class func description() -> String {
        return "DashboardViewController"
    }

    let sideBar      = SideBarViewController()
    let transition   = SideBarAnimation()
    var topView     : UIView?   //use for tabSwitch
    let data        : [String] = ["donuts","burger","noodel","pasta","pizza","donuts","burger","noodel","pasta","pizza"]
    
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
        
        transition.tapGesture = {
            self.sideBar.dismiss(animated: true, completion: nil)
            print("remove sidebar")
        }
    }
    
    
    
    private func configureCustomCell(){
        
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
        sideBar.modalPresentationStyle  = .overCurrentContext
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
    
    
    private func configureCollectionView(){
        ibOfferCollection?.layer.cornerRadius = 10
        ibOfferCollection?.clipsToBounds      = true
    }
   
    private func tableViewDelegateSet(){
        ibHotelListTable?.dataSource          = self
        ibHotelListTable?.delegate            = self
    }
    //Mark:  InnerView offer CollectionView Delegate
    private func collectionViewDelegateSet(){
        ibOfferCollection?.delegate           = self
        ibOfferCollection?.dataSource         = self
    }
    
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
//MARK: Inner card collectionView( benner )
extension DashboardViewController:
    UICollectionViewDataSource,
    UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "CollectionViewCell",
            for: indexPath)as! CollectionViewCell
        
        cell.ibImageHolder.image = UIImage(named: data[indexPath.row])
        cell.layer.cornerRadius  = 20
        cell.layer.borderWidth   = 1.0
        cell.layer.borderColor   = UIColor.black.cgColor
        cell.ibImageHolder
            .layer.cornerRadius  = 20
        return cell
    }
}

//MARK: TableView
extension DashboardViewController:
    UITableViewDataSource,
    UITableViewDelegate{
    //data source
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
       
        var rows = 0
        if  tableView == self.ibHotelListTable{
            rows = hotelDetails.count
        }
        return rows
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == self.ibHotelListTable{
        
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "cell",
                for: indexPath)as! CellTableViewHome
            
            let obj                = hotelDetails[indexPath.row]
            cell.hotelImage.image  = obj.image
            cell.hotelName.text    = obj.hotelNama
            cell.hotelType.text    = obj.hotelType
            cell.hotelAddress.text = obj.hotelAddress
            return cell
        }
        return UITableViewCell()
    }
    //delegate
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {

            print("home: \(indexPath)")
            let obj  = hotelDetails[indexPath.row]
            let vc   = UIStoryboard(name: "food_categories", bundle: nil).instantiateViewController(withIdentifier: FoodCategoriesViewController.identifier)
                as! FoodCategoriesViewController
            vc.title = obj.hotelNama
            navigationController?
                .pushViewController(vc, animated: true)
    }
}
// MARK: transitionDelegate
extension DashboardViewController :
    UIViewControllerTransitioningDelegate{
    
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
}

//MARK: SideBarMenu Viewcontroller delegate
extension DashboardViewController:
    SideBarViewControllerDelegate{
    
    func didTapMenu(MenuOption: SideBarMenuOption) {
        //set navBar title
        navigationItem.title = MenuOption.rawValue
        topView?.removeFromSuperview()
        
        guard
              let account = storyboard?.instantiateViewController(withIdentifier: "AccountViewController")as? AccountViewController ,
              let review =
                storyboard?.instantiateViewController(withIdentifier: "OrderViewController")as? OrderViewController ,
              let settings = storyboard?.instantiateViewController(withIdentifier: "MyFavListViewController")as? MyFavListViewController
              else{
            
            fatalError()
        }
        
    switch MenuOption {
        case .home:
//           print("home")
            topView = nil
           
        case .account:
            print("accout")
         
            addChild(account)
            topView = account.view
//            topView?.removeFromSuperview()
//            account?.removeFromParent()
        case .order:
//            print("Your Orders")
            topView = review.view
            
        case .yourFavList:
//            print("YouFavList")

            topView = settings.view
            
        case .logout:
            print("logout")
        }
        topView != nil ? view.addSubview(topView!) : nil
    }
}


