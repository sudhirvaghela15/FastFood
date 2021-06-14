//
//  HomepageVc.swift
//  Fast_Food
//
//  Created by sudhir on 19/05/21.
//

import UIKit

var catagoriesItem = [
    CategorieItems(categorie: "Burger", itemSubName: ["CheesBurger","NormalBurger","spicyBurger","CheesBurger","NormalBurger","spicyBurger","CheesBurger","NormalBurger","spicyBurger"], itemSubImage: ["pizza","pizza","pizza","pizza","pizza","pizza","pizza","pizza","pizza"]),
    
    CategorieItems(categorie: "Sub Way", itemSubName: ["CheesBurger","NormalBurger","spicyBurger","CheesBurger","NormalBurger","spicyBurger","CheesBurger","NormalBurger","spicyBurger"], itemSubImage: ["pizza","pizza","pizza","pizza","pizza","pizza","pizza","pizza","pizza"]),
    
    CategorieItems(categorie: "Pizza", itemSubName: ["CheesBurger","NormalBurger","spicyBurger","CheesBurger","NormalBurger","spicyBurger","CheesBurger","NormalBurger","spicyBurger"], itemSubImage: ["pizza","pizza","pizza","pizza","pizza","pizza","pizza","pizza","pizza"]),
    
    CategorieItems(categorie: "Chinese", itemSubName: ["ItalianPizza","NormalBurger","spicyBurger","CheesBurger","NormalBurger","spicyBurger","CheesBurger","NormalBurger","spicyBurger"], itemSubImage: ["pizza","pizza","pizza","pizza","pizza","pizza","pizza","pizza","pizza"]),
]

class HomeViewController: UIViewController {

    let menuVc = MenuViewController()
    let transition = MenuAnimation()
    var topView : UIView?   //use for tabSwitch
    let data : [String] = ["donuts","burger","noodel","pasta","pizza","donuts","burger","noodel","pasta","pizza"]
    
    var hotelDetails: [HotelDetails] = []
    
//    MARK: OUTLETS
    @IBOutlet weak var ibTvSearchBar: UITextField!
    @IBOutlet weak var ibOfferCollection:UICollectionView!
    @IBOutlet weak var ibHotelListTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSearchbar()
        configureCollectionView()
        collectionViewDelegateSet()
        tableViewDelegateSet()
        setArrayHotelList()
        configureNavigationBar()
        configureCustomCell()
        menuVc.delegate = self
        
        
    }
    private func configureCustomCell(){
        
        let nib = UINib(nibName: "CellTableViewHome", bundle: nil)
        ibHotelListTable.register(nib, forCellReuseIdentifier: "cell")
    }
    
    private func configureNavigationBar(){
        
        navigationItem.title = "FastFood"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .done, target: self, action: #selector(didTapMenuBtn))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "cart"), style: .done, target: self, action: #selector(didTapCartBtn))
        navigationItem.rightBarButtonItem?.tintColor = .black
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    @objc
    func didTapMenuBtn(){
        menuVc.modalPresentationStyle = .overCurrentContext
        menuVc.transitioningDelegate = self
        present(menuVc, animated: true)
    }
    @objc
    func didTapCartBtn(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "CartViewController")as! CartViewController
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    private func configureSearchbar(){
        ibTvSearchBar?.layer.cornerRadius = ibTvSearchBar.frame.size.height / 2
        ibTvSearchBar?.clipsToBounds = true
        ibTvSearchBar?.layer.borderWidth = 1.0
        ibTvSearchBar?.layer.backgroundColor = UIColor.black.cgColor
        ibTvSearchBar?._IconBtn(image: UIImage(systemName: "magnifyingglass"), space: 10, direction: "Left",width: 30,height: 30)
        ibTvSearchBar?.tintColor = UIColor.black
    }
    private func configureCollectionView(){
        ibOfferCollection?.layer.cornerRadius = 10
        ibOfferCollection?.clipsToBounds      = true
    }
    private func collectionViewDelegateSet(){
        ibOfferCollection?.delegate = self
        ibOfferCollection?.dataSource = self
    }
    private func tableViewDelegateSet(){
       
        ibHotelListTable?.dataSource = self
        ibHotelListTable?.delegate   = self
        
    }
    
    private func setArrayHotelList(){
        
        hotelDetails.append(HotelDetails(image: UIImage(named: "HotelMadhuri"), hotelNama: "Pradhyum",hotelType: "Veg",hotelAddress: "2-A,Balash,\nDholka-382225"))
        
        hotelDetails.append(HotelDetails(image: UIImage(named: "Hotel_sarover_portico"), hotelNama: "Shree Nath", hotelRating: "5.0", hotelType: "Veg", hotelAddress: "23-S,Dholka-kheda Road,\nDholka-382225"))
        
        hotelDetails.append(HotelDetails(image: UIImage(named: "amrutfalhotelandrestaurant"), hotelNama: "Punjabi Tadka", hotelRating: "5.0", hotelType: "Veg", hotelAddress: "32-S,Kalikund,\nDholka-382225"))
        hotelDetails.append(HotelDetails(image: UIImage(named: "cherries_restaurant"), hotelNama: "cherries_restaurant Tadka", hotelRating: "5.0", hotelType: "Veg", hotelAddress: "32-S,Kalikund,\nDholka-382225"))
        }
}
//MARK: CollectionView
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)as! CollectionViewCell
        cell.ibImageHolder.image = UIImage(named: data[indexPath.row])
        cell.ibImageHolder.layer.cornerRadius = 20
        cell.layer.cornerRadius = 20
        cell.layer.borderWidth  = 1.0
        cell.layer.borderColor  = UIColor.black.cgColor
        
        return cell
    }
}

//MARK: TableView
extension HomeViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rows = 0
        if tableView == self.ibHotelListTable{
            rows = hotelDetails.count
        }
        return rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == self.ibHotelListTable{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)as! CellTableViewHome
            let obj = hotelDetails[indexPath.row]
            cell.hotelImage.image  = obj.image
            cell.hotelName.text    = obj.hotelNama
            cell.hotelType.text    = obj.hotelType
            cell.hotelAddress.text = obj.hotelAddress
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            print("home: \(indexPath)")
            let obj = hotelDetails[indexPath.row]
                
            let vc = storyboard?.instantiateViewController(withIdentifier: "ItemMenuViewController")as! ItemMenuViewController
                vc.title  = obj.hotelNama
            self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
// MARK: transitionDelegaate
extension HomeViewController: UIViewControllerTransitioningDelegate{
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
}

//MARK: Menu view controller navigation delegate
extension HomeViewController: MenuViewControllerDelegate{
    func didTapMenu(MenuItem: MenuViewController.MenuOption) {
        
        navigationItem.title = MenuItem.rawValue
        topView?.removeFromSuperview()
        
    switch MenuItem{
        case .home:
           print("home")
            topView = nil
            
        case .account:
//            print("accout")
           let account = storyboard?.instantiateViewController(withIdentifier: "AccountViewController")as! AccountViewController
            addChild(account)
//            self.view.addSubview(account.view)
            topView = account.view
            
        case .order:
//            print("Your Orders")
            let review = storyboard?.instantiateViewController(withIdentifier: "OrderViewController")as! OrderViewController
//            view.addSubview(review.view)
            topView = review.view
            
        case .yourFavList:
//            print("YouFavList")
            let settings = storyboard?.instantiateViewController(withIdentifier: "MyFavListViewController")as! MyFavListViewController
//            view.addSubview(settings.view)
            topView = settings.view
            
        case .logout:
            print("logout")
        }
        topView != nil ? view.addSubview(topView!) : nil
    }
}


