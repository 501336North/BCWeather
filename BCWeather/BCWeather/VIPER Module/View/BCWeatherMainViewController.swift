//
//  BCWeatherMainViewController.swift
//  BCWeather
//
//  Created by Yanick Lavoie on 2019-05-25.
//  Copyright © 2019 PixelBuzz. All rights reserved.
//

import UIKit

class BCWeatherMainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var openWeatherItems: [OpenWeather] = []
    var presenter: BCWeatherPresenterProtocol?
    var locationManager = LocationManager()
    private let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "BCWeather"
        locationManager.delegate = self
        setupTableView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //TODO: We probably need to move that elsewhere
        refreshWeatherData(self)
    }

    private func setupTableView() {
        let cell = UINib(nibName: "BCWeatherMainCell", bundle: nil)
        self.tableView.register(cell, forCellReuseIdentifier: "MainWeatherCell")
        self.tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshWeatherData(_:)), for: .valueChanged)
    }

    @objc func refreshWeatherData(_ sender: Any) {
        var currentCity = ""
        guard let exposedLocation = locationManager.exposedLocation else {
            self.presenter?.retrieveWeather(for: currentCity)
            return
        }

        locationManager.getPlace(for: exposedLocation) { placemark in
            guard let placemark = placemark else { return }
            currentCity = placemark.locality ?? ""
            currentCity = currentCity.folding(options: .diacriticInsensitive, locale: .current)
            self.presenter?.retrieveWeather(for: currentCity)
        }
    }


    @IBAction func settingsTapped(_ sender: Any) {
        presenter?.showSettingsActionSheet(from: self)
    }
}

extension BCWeatherMainViewController:  BCWeatherMainViewProtocol {

    func showOpenWeatherView(with openWeather: [OpenWeather]) {
        openWeatherItems = openWeather
        refreshControl.endRefreshing()
        guard let tableView = tableView else { return }
        tableView.reloadData()
    }

    func refreshWeather() {
        refreshWeatherData(self)
    }

    func showError() {
    }

    func showLoading() {
    }

    func hideLoading() {
    }
}

extension BCWeatherMainViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return openWeatherItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainWeatherCell", for: indexPath) as! BCWeatherMainCell
        cell.configure(openWeather: openWeatherItems[indexPath.row])

        return cell
    }

    func tableView(_: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180.0
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }

    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        let cell = tableView.cellForRow(at: indexPath)
        if cell?.isSelected ?? false == true {
            return nil
        }
        return indexPath
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.navigateToDetails(weather: openWeatherItems[indexPath.row], from: self)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            self.tableView.deselectRow(at: indexPath, animated: true)
        })

    }
}
