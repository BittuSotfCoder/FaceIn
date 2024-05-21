import 'package:facein/widgets/FriendSearch.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FacebookHomePage());
}

class FacebookHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Stories Section
           FriendsSearch(),
              ...List.generate(10, (index) => PostCard()),
            ],
          ),
        ),
      ),
    );
  }
}

class StoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage('https://via.placeholder.com/150'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class CreatePostSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.white,
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          ),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'What\'s on your mind?',
                border: InputBorder.none,
              ),
            ),
          ),
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
