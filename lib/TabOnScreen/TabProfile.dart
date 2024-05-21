import 'package:facein/widgets/CircularIcon.dart';
import 'package:facein/widgets/IconTextButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TabProfile extends StatelessWidget{
  const TabProfile({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration:  const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffa8edea), Color(0xfffed6e3)],
          )),
          child:  Material(
            child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://allglobal.net/wp-content/uploads/2021/05/URL-e1622012392682.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Positioned(
                      bottom: 10,
                      left: 16,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                            'https://icon-library.com/images/url-icon-png/url-icon-png-13.jpg'),
                        backgroundColor: Colors.white,
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 100,
                      child: CircularIcon(
                        icon: Icons.camera_alt,
                        iconSize: 20,
                        backgroundColor: Colors.grey,
                        iconColor: Colors.black,
                        size: 40,
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 16,
                      child: CircularIcon(
                        icon: Icons.camera_alt,
                        iconSize: 30,
                        backgroundColor: Colors.white,
                        iconColor: Colors.black,
                        size: 50,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                                 Text('John Doe',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                              IconTextButton(
                              icon: Icons.edit,
                                label: 'Edit Profile',
                                 onPressed: () {
                                  print('Edit button pressed');
                                     },
                                  iconColor: Colors.black,
                                   textColor: Colors.black,
                                     backgroundColor: Colors.grey,
                                ),
                            ],
                          ),
                      SizedBox(height: 8),
                      Text('Software Developer at XYZ Company',
                          style: TextStyle(color: Colors.grey[700])),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Icon(Icons.school, color: Colors.grey[700]),
                          SizedBox(width: 8),
                          Text('Studied at ABC University',
                              style: TextStyle(color: Colors.grey[700])),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.home, color: Colors.grey[700]),
                          SizedBox(width: 8),
                          Text('Lives in City, Country',
                              style: TextStyle(color: Colors.grey[700])),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.grey[700]),
                          SizedBox(width: 8),
                          Text('From Hometown, Country',
                              style: TextStyle(color: Colors.grey[700])),
                        ],
                      ),
                      SizedBox(height: 16),
                      Divider(),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         const Text('Friends',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                          InkWell(
                          onTap: (){},
                          child:const Text('See all',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17,color:Color.fromRGBO(24, 119, 242, 1) ),))
                        ],
                      ),
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
        children: const [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage('https://allglobal.net/wp-content/uploads/2021/05/URL-e1622012392682.jpeg'),
          ),
          SizedBox(height: 8),
          Text('Friend jkasm ', overflow:  TextOverflow.ellipsis),
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

