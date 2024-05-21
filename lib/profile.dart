import 'package:flutter/material.dart';


class FacebookProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('https://allglobal.net/wp-content/uploads/2021/05/URL-e1622012392682.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Positioned(
                    bottom: 0,
                    left: 16,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                      backgroundColor: Colors.white,
                  
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 16,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Edit Profile'),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('John Doe', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text('Software Developer at XYZ Company', style: TextStyle(color: Colors.grey[700])),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(Icons.school, color: Colors.grey[700]),
                        SizedBox(width: 8),
                        Text('Studied at ABC University', style: TextStyle(color: Colors.grey[700])),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.home, color: Colors.grey[700]),
                        SizedBox(width: 8),
                        Text('Lives in City, Country', style: TextStyle(color: Colors.grey[700])),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.grey[700]),
                        SizedBox(width: 8),
                        Text('From Hometown, Country', style: TextStyle(color: Colors.grey[700])),
                      ],
                    ),
                    SizedBox(height: 16),
                    Divider(),
                    SizedBox(height: 8),
                    Text('Friends', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Container(
                      height: 100,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(10, (index) => FriendCard()),
                      ),
                    ),
                    SizedBox(height: 16),
                    Divider(),
                    // Posts Feed Section
                    ...List.generate(10, (index) => PostCard()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FriendCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          ),
          SizedBox(height: 8),
          Text('Friend jkasm ', overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            title: Text('User Name'),
            subtitle: Text('5 mins ago'),
            trailing: Icon(Icons.more_horiz),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text('This is a sample post.'),
          ),
          Image.network('https://via.placeholder.com/500x250'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.thumb_up, color: Colors.grey),
                  label: Text('Like', style: TextStyle(color: Colors.grey)),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.comment, color: Colors.grey),
                  label: Text('Comment', style: TextStyle(color: Colors.grey)),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.share, color: Colors.grey),
                  label: Text('Share', style: TextStyle(color: Colors.grey)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
