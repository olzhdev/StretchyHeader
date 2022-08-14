
import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    // MARK: - Layout Elements
    /// Root elements
    var scrollView = UIScrollView()
    var label = UILabel()
    var headerContainerView = UIView()
    var imageView = UIImageView()
    
    /// Content view that contains contentElements
    let contentView = UIView()
    
    /// ContentElements
    let elem1 = UIView()
    let elem2 = UIView()

    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setViewConstraints()
    }

    private func configureUI() {
        scrollView.delegate = self
        scrollView.backgroundColor = .systemBackground
        scrollView.layer.cornerRadius = 25
        scrollView.layer.masksToBounds = true
        scrollView.layer.cornerCurve = .continuous
    
        headerContainerView.backgroundColor = .gray
        
        imageView.clipsToBounds = true
        imageView.backgroundColor = .green
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "cat")
        
        //contentView.backgroundColor = .yellow
        elem1.backgroundColor = .systemMint
        elem2.backgroundColor = .red
    }
    
    private func setContentViewConstraints() {
        contentView.addSubview(elem1)
        contentView.addSubview(elem2)
        
        elem1.translatesAutoresizingMaskIntoConstraints = false
        elem2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            elem1.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            elem1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            elem1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            elem1.heightAnchor.constraint(equalToConstant: 300),
            elem1.bottomAnchor.constraint(equalTo: elem2.topAnchor, constant: -35),
            
            elem2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            elem2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            elem2.heightAnchor.constraint(equalToConstant: 300),
            elem2.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
        ])
    }
    
    private func setViewConstraints() {
        view.addSubview(scrollView)
        scrollView.addSubview(headerContainerView)
        headerContainerView.addSubview(imageView)
        
        // ScrollView Constraints
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // Content View Constraint
        // leading, trailing: view | bottom: scrollView.bottom = -10 | scrollView.top = 280
        // Height of ContentView calculates based on inside elements

        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 280)
        ])
        
        // Subviews in ContentView. Configure all constraints here.
        setContentViewConstraints()
        
        // Header Container Constraints
        let headerContainerViewBottom : NSLayoutConstraint!
        headerContainerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerContainerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        headerContainerViewBottom = headerContainerView.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant: 15)
        headerContainerViewBottom.priority = UILayoutPriority(rawValue: 900)
        headerContainerViewBottom.isActive = true
        
        // ImageView Constraints
        let imageViewTopConstraint: NSLayoutConstraint!
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: headerContainerView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: headerContainerView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: headerContainerView.bottomAnchor)
        ])
        
        imageViewTopConstraint = imageView.topAnchor.constraint(equalTo: view.topAnchor)
        imageViewTopConstraint.priority = UILayoutPriority(rawValue: 900)
        imageViewTopConstraint.isActive = true
    }

}

