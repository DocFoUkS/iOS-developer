//
//  PlayersViewController.swift
//  NBAPlayers
//
//  Created by Aleksandr Anosov on 04.11.2020.
//

import UIKit

class PlayersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var reloadButton: UIButton!
    var players: [Player] = []
    let apiClient: ApiClient = ApiClientImpl()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        reload()
    }
    
    @IBAction func onReloadButtonClick(_ sender: Any) {
        reload()
    }

    func showLoading() {
        activityIndicator.startAnimating()
        errorLabel.isHidden = true
        reloadButton.isHidden = true
    }

    func showError() {
        activityIndicator.stopAnimating()
        errorLabel.isHidden = false
        reloadButton.isHidden = false
    }

    func showData() {
        activityIndicator.stopAnimating()
        errorLabel.isHidden = true
        reloadButton.isHidden = true
    }

    func reload() {
        showLoading()
        apiClient.getPlayers(completion: { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let players):
                    self.players = players
                    self.tableView.reloadData()
                    self.showData()
                case .failure:
                    self.players = []
                    self.tableView.reloadData()
                    self.showError()
                }
            }
        })
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath)

        let player = players[indexPath.row]

        cell.textLabel?.text = player.fullName
        cell.detailTextLabel?.text = player.team.fullName

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateViewController(identifier: "PlayerDetailsViewController") as! PlayerDetailsViewController

        let player = players[indexPath.row]
        viewController.player = player

        navigationController?.pushViewController(viewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
