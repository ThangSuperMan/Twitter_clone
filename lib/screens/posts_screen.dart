import 'package:flutter/material.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class Post extends StatelessWidget {
  const Post({super.key});
  static const postImageUrl =
      'https://pbs.twimg.com/media/GIawQOnXoAAqreC?format=jpg&name=900x900';
  static const avatarUrl =
      'https://pbs.twimg.com/profile_images/1207636309508014081/hfA24vWM_x96.jpg';

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xFFF0F4F5),
              width: 1.0,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              leading: const CircleAvatar(
                backgroundImage: NetworkImage(avatarUrl),
              ),
              title: const Text('User'),
              subtitle: const Text('@user'),
              trailing: IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {
                  // Add your action here
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'This is a sample tweet. Welcome to Twitter! Hello there',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  postImageUrl,
                  height: 480,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(Icons.favorite_border),
                  onPressed: () {
                    // Add your action here
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.chat_bubble_outline),
                  onPressed: () {
                    // Add your action here
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.bookmark_outline),
                  onPressed: () {
                    // Add your action here
                  },
                ),
              ],
            ),
          ],
        ));
  }
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            leading: Padding(
              padding: const EdgeInsets.all(6),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: const CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://getwallpapers.com/wallpaper/full/6/a/e/768271-popular-panda-bear-background-2500x1667-cell-phone.jpg',
                  ),
                ),
              ),
            ),
            shape: const Border(
              bottom: BorderSide(
                color: Color(0xFFF0F4F5),
                width: 1.0, // Adjust thickness here
              ),
            ),
            title: SizedBox(
              width: 40,
              child: Image.asset('assets/images/logo-48.png'),
            ),
            floating: true,
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Post(),
          ),
          SliverToBoxAdapter(
            child: Post(),
          ),
        ],
      ),
    );
  }
}
