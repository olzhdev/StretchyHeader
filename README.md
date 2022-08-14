# StretchyHeader

ViewController with ScrollView and stretchy header. 

<p align="center">
<img height=360 width=180 src="https://user-images.githubusercontent.com/53051473/183468459-9a8b6fef-d149-41fa-93f7-b6b0b48b67c9.gif">
<img height=360 width=180 src="https://user-images.githubusercontent.com/53051473/184530655-eed6814a-9ca1-4481-a221-13bea0064072.gif">
</p>

## How to use

All required configurations are setted. All you need to do is layout your elements in setContentViewConstraints() function.
And don't forget change imageView.image = UIImage(named: "cat") to your image.


```swift
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
```

##
Give a star if it was helpful :)
