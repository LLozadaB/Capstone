//
//  PostsTableViewController.swift
//  Capstone
//

import UIKit
import Nuke

class PostsTableViewController: UITableViewController {

    @IBOutlet weak var postsTableView: UITableView!

    var posts: [Post] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        postsTableView.dataSource = self
        fetchPosts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let selectedIndexPath = postsTableView.indexPathForSelectedRow {
            postsTableView.deselectRow(at: selectedIndexPath, animated: animated)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedIndexPath = postsTableView.indexPathForSelectedRow else {
            return
        }
        
        let selectedPost = posts[selectedIndexPath.row]

        guard let detail = segue.destination as? DetailViewController else {
            return
        }

        detail.post = selectedPost
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell

        let post = posts[indexPath.row]
        cell.titleLabel.text = "Community Post"
        cell.postLabel.text = post.summary

        if let photo = post.photos.first {
            let url = photo.originalSize.url
            Nuke.loadImage(with: url, into: cell.postImageView)
        }

        return cell
    }

    func fetchPosts() {
        let url = URL(string: "https://api.tumblr.com/v2/blog/humansofnewyork/posts/photo?api_key=1zT8CiXGXFcQDyMFG7RtcfGLwTdDjFUJnZzKJaWTmgyK4lKGYk")!
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, (200...299).contains(statusCode) else {
                print("Error: \(String(describing: response))")
                return
            }

            guard let data = data else {
                print("Error: Data does not exist")
                return
            }

            do {
                let blog = try JSONDecoder().decode(Blog.self, from: data)

                DispatchQueue.main.async { [weak self] in

                    let posts = blog.response.posts
                    self?.posts = posts
                    self?.postsTableView.reloadData()

                }

            } catch {
                print("JSON Error: \(error.localizedDescription)")
            }
        }
        session.resume()
    }
}
