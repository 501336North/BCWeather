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
    var presenter: BCWeatherMainPresenterProtocol?
    private let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //TODO: We probably need to move that elsewhere
        refreshWeatherData(self)
    }

    private func setupTableView() {
        let cell = UINib(nibName: "BCWeatherMainCell", bundle: nil)
        self.tableView.register(cell, forCellReuseIdentifier: "MainWeatherCell")
        self.tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshWeatherData(_:)), for: .valueChanged)
    }

    @objc private func refreshWeatherData(_ sender: Any) {
        //TODO: this definitely looks wrong... fix
        presenter?.interactor?.retrieveWeather(for: "")
    }
}

extension BCWeatherMainViewController:  BCWeatherMainViewProtocol {
    
    func showOpenWeatherView(with openWeather: [OpenWeather]) {
        openWeatherItems = openWeather
        refreshControl.endRefreshing()
        guard let tableView = tableView else { return }
        tableView.reloadData()
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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath) as! BCWeatherMainCell
        let openWeather = openWeatherItems[indexPath.row]

        //TODO: push Details Controller using Interactor
    }
}
