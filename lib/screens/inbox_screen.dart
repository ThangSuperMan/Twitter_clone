import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter_clone/screens/posts_screen.dart';
import 'package:twitter_clone/widgets/create_post_popup_window.dart';
import 'package:twitter_clone/screens/hello_screen.dart';
import 'package:twitter_clone/screens/second_screen.dart';
import 'package:twitter_clone/screen_chat/home_screen.dart';
import 'package:twitter_clone/widgets/notification_options_popup_window.dart';
import 'package:twitter_clone/widgets/sidebar.dart';

const POSTS_SCREEN_INDEX = 0;
const HELLO_SCREEN_INDEX = 1;
const CREATE_POST_SCREEN_INDEX = 2;
const MESSAGE_SCREEN_INDEX = 3;
const NOTIFICATIONS_SCREEN_INDEX = 4;

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

List<Widget> screens = [
  const PostsScreen(),
  SecondScreen(),
  HelloScreen(),
  const HomeScreen(),
];

class _InboxScreenState extends State<InboxScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 52,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Builder(
            builder: (BuildContext context) {
              return Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Container(
                      width: 28,
                      height: 28,
                      child: SvgPicture.string(
                        '''
                         <svg stroke="currentColor" fill="none" viewBox="0 0 24 24">
                           <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1" d="M4 6h16M4 12h16M4 18h16"></path>
                         </svg>
                       ''',
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.string(
                  '''
                  <svg fill="currentColor" height="24" icon-name="search-outline" viewBox="0 0 20 20" width="24" xmlns="http://www.w3.org/2000/svg">
                    <path d="M19.5 18.616 14.985 14.1a8.528 8.528 0 1 0-.884.884l4.515 4.515.884-.884ZM1.301 8.553a7.253 7.253 0 1 1 7.252 7.253 7.261 7.261 0 0 1-7.252-7.253Z"></path>
                  </svg>
                ''',
                  height: 26,
                  width: 26,
                ),
                const SizedBox(width: 20),
                Container(
                  width: 40,
                  height: 40,
                  child: Stack(
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://preview.redd.it/snoovatar/avatars/nftv2_bmZ0X2VpcDE1NToxMzdfZWI5NTlhNzE1ZGZmZmU2ZjgyZjQ2MDU1MzM5ODJjNDg1OWNiMTRmZV8yNTU5MjM0OQ_rare_7b15159a-149e-48db-b70f-e9a3f0b94af2-headshot.png?width=128&height=128&crop=smart&auto=webp&s=fe40df49b6cfeeeaa9ae43fa8476482c2157cd96',
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
        shape: const Border(
          bottom: BorderSide(
            color: Color(0xFFF0F4F5),
            width: 1.0,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey.shade300,
                      width: 1.0,
                    ),
                  ),
                ),
                child: const Text(
                  "Mới",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://i.redd.it/snoovatar/avatars/basic/68f84a50-fb31-40ff-8ef7-a267f3438be6.png',
                    ),
                    radius: 20,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            text: const TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: 'longhung' + ' ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          TextSpan(
                              text: 'đã trở thành người theo dõi của bạn.',
                              style: TextStyle(color: Colors.black)),
                        ])),
                        const Text(
                          'Vừa xong',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {
                      setState(() {
                        _showNotificationOptionsModal(context);
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://i.redd.it/snoovatar/avatars/basic/68f84a50-fb31-40ff-8ef7-a267f3438be6.png',
                    ),
                    radius: 20,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            text: const TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: 'longhung' + ' ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          TextSpan(
                              text: 'đã thích bài viết của bạn.',
                              style: TextStyle(color: Colors.black)),
                        ])),
                        const Text(
                          '1 phút trước',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {
                      setState(() {
                        _showNotificationOptionsModal(context);
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://i.redd.it/snoovatar/avatars/basic/f63b20d2-8bac-4645-8a2e-8bc5502afff1.png',
                    ),
                    radius: 20,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            text: const TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: 'lannguyen' + ' ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          TextSpan(
                              text: 'đã thích bài viết của bạn.',
                              style: TextStyle(color: Colors.black)),
                        ])),
                        const Text(
                          '5 phút trước',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {
                      setState(() {
                        _showNotificationOptionsModal(context);
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey.shade300,
                      width: 1.0,
                    ),
                  ),
                ),
                child: const Text(
                  "Cũ hơn",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://i.redd.it/snoovatar/avatars/basic/b6f006d2-464b-4328-8465-c1c469c73f8e.png',
                    ),
                    radius: 20,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            text: const TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: 'khaido' + ' ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          TextSpan(
                              text: 'đã trở thành người theo dõi của bạn.',
                              style: TextStyle(color: Colors.black)),
                        ])),
                        const Text(
                          '45 phút trước',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {
                      setState(() {
                        _showNotificationOptionsModal(context);
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://i.redd.it/snoovatar/avatars/basic/f63b20d2-8bac-4645-8a2e-8bc5502afff1.png',
                    ),
                    radius: 20,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            text: const TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: 'lannguyen' + ' ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          TextSpan(
                              text: 'đã trở thành người theo dõi của bạn.',
                              style: TextStyle(color: Colors.black)),
                        ])),
                        const Text(
                          '1 giờ trước',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {
                      setState(() {
                        _showNotificationOptionsModal(context);
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://i.redd.it/snoovatar/avatars/basic/b6f006d2-464b-4328-8465-c1c469c73f8e.png',
                    ),
                    radius: 20,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            text: const TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: 'khaido' + ' ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          TextSpan(
                              text: 'đã thích bài viết của bạn.',
                              style: TextStyle(color: Colors.black)),
                        ])),
                        const Text(
                          '3 giờ trước',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {
                      setState(() {
                        _showNotificationOptionsModal(context);
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://i.redd.it/snoovatar/avatars/basic/d21d6e14-127c-4358-8ae7-0a540f888c2a.png',
                    ),
                    radius: 20,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            text: const TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: 'hoangngoc' + ' ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          TextSpan(
                              text: 'đã thích bài viết của bạn.',
                              style: TextStyle(color: Colors.black)),
                        ])),
                        const Text(
                          '22 giờ trước',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {
                      setState(() {
                        _showNotificationOptionsModal(context);
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://i.redd.it/snoovatar/avatars/basic/78b9ab88-8e28-4e69-b07d-14048d4b29f9.png',
                    ),
                    radius: 20,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            text: const TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: 'hungnguyen' + ' ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          TextSpan(
                              text: 'đã trở thành người theo dõi của bạn.',
                              style: TextStyle(color: Colors.black)),
                        ])),
                        const Text(
                          '5 ngày trước',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {
                      setState(() {
                        _showNotificationOptionsModal(context);
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: RedditStyleBottomNavigation(),
    );
  }
}

void _showNotificationOptionsModal(BuildContext context) {
  double screenHeight = MediaQuery.of(context).size.height - 350;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return NotificationOptionsPopupWindow(screenHeight: screenHeight);
    },
  );
}

class RedditStyleBottomNavigation extends StatefulWidget {
  @override
  _RedditStyleBottomNavigationState createState() =>
      _RedditStyleBottomNavigationState();
}

class _RedditStyleBottomNavigationState
    extends State<RedditStyleBottomNavigation> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      selectedLabelStyle: const TextStyle(color: Colors.red),
      unselectedLabelStyle: const TextStyle(color: Colors.yellow),
      onTap: _onItemTapped,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.string(
            '''
              <svg rpl="" fill="currentColor" height="20" icon-name="home-outline" viewBox="0 0 20 20" width="20" xmlns="http://www.w3.org/2000/svg">
                <path d="m17.71 8.549 1.244.832v8.523a1.05 1.05 0 0 1-1.052 1.046H12.73a.707.707 0 0 1-.708-.707v-4.507c0-.76-1.142-1.474-2.026-1.474-.884 0-2.026.714-2.026 1.474v4.507a.71.71 0 0 1-.703.707H2.098a1.046 1.046 0 0 1-1.052-1.043V9.381l1.244-.835v9.158h4.44v-3.968c0-1.533 1.758-2.72 3.27-2.72s3.27 1.187 3.27 2.72v3.968h4.44V8.549Zm2.04-1.784L10.646.655a1.12 1.12 0 0 0-1.28-.008L.25 6.765l.696 1.036L10 1.721l9.054 6.08.696-1.036Z"></path>
              </svg>
            ''',
            color: Colors.black.withOpacity(0.6),
            height: 26,
            width: 26,
          ),
          label: 'Trang chủ',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.string(
            '''
              <svg viewBox="0 0 24 24" width="24" height="24" fill="currentColor" class="x19dipnz x1lliihq x1k90msu x2h7rmj x1qfuztq" style="--color: var(--secondary-icon);">
                <path d="M8 2.5a4.5 4.5 0 1 0 0 9 4.5 4.5 0 0 0 0-9zM5.5 7a2.5 2.5 0 1 1 5 0 2.5 2.5 0 0 1-5 0zm-.25 6A4.75 4.75 0 0 0 .5 17.75 3.25 3.25 0 0 0 3.75 21h8.5a3.25 3.25 0 0 0 3.25-3.25A4.75 4.75 0 0 0 10.75 13h-5.5zM2.5 17.75A2.75 2.75 0 0 1 5.25 15h5.5a2.75 2.75 0 0 1 2.75 2.75c0 .69-.56 1.25-1.25 1.25h-8.5c-.69 0-1.25-.56-1.25-1.25zM14 9.5a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0zM17.5 8a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zm0 6.5a1 1 0 1 0 0 2h2.3a1.7 1.7 0 0 1 1.7 1.7.8.8 0 0 1-.8.8h-3.2a1 1 0 1 0 0 2h3.2a2.8 2.8 0 0 0 2.8-2.8 3.7 3.7 0 0 0-3.7-3.7h-2.3z"></path>
              </svg>
            ''',
            color: Colors.black.withOpacity(0.6),
            height: 26,
            width: 26,
          ),
          label: 'Cộng đồng',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.string(
            '''
            <svg rpl="" fill="currentColor" height="20" icon-name="add-outline" viewBox="0 0 20 20" width="20" xmlns="http://www.w3.org/2000/svg">
              <path d="M19 9.375h-8.375V1h-1.25v8.375H1v1.25h8.375V19h1.25v-8.375H19v-1.25Z"></path>
            </svg>
            ''',
            color: Colors.black.withOpacity(0.6),
            height: 26,
            width: 26,
          ),
          label: 'Tạo bài',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.string(
            '''
              <svg rpl="" fill="currentColor" height="20" icon-name="chat-outline" viewBox="0 0 20 20" width="20" xmlns="http://www.w3.org/2000/svg">
                <path d="M11.61 19.872a10.013 10.013 0 0 0 6.51-4.035A9.999 9.999 0 0 0 12.275.264c-1.28-.3-2.606-.345-3.903-.132a10.05 10.05 0 0 0-8.25 8.311 9.877 9.877 0 0 0 1.202 6.491l-1.24 4.078a.727.727 0 0 0 .178.721.72.72 0 0 0 .72.19l4.17-1.193A9.87 9.87 0 0 0 9.998 20c.54 0 1.079-.043 1.612-.128ZM1.558 18.458l1.118-3.69-.145-.24A8.647 8.647 0 0 1 1.36 8.634a8.778 8.778 0 0 1 7.21-7.27 8.765 8.765 0 0 1 8.916 3.995 8.748 8.748 0 0 1-2.849 12.09 8.763 8.763 0 0 1-3.22 1.188 8.68 8.68 0 0 1-5.862-1.118l-.232-.138-3.764 1.076ZM6.006 9a1.001 1.001 0 0 0-.708 1.707A1 1 0 1 0 6.006 9Zm4.002 0a1.001 1.001 0 0 0-.195 1.981 1 1 0 1 0 .195-1.98Zm4.003 0a1.001 1.001 0 1 0 0 2.003 1.001 1.001 0 0 0 0-2.003Z"></path>
              </svg>
            ''',
            color: Colors.black.withOpacity(0.6),
            height: 26,
            width: 26,
          ),
          label: 'Nhắn tin',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.string(
            '''
              <svg rpl="" fill="currentColor" height="20" icon-name="notification-outline" viewBox="0 0 20 20" width="20" xmlns="http://www.w3.org/2000/svg">
                <path d="M11 18h1a2 2 0 0 1-4 0h3Zm8-3.792v.673A1.12 1.12 0 0 1 17.883 16H2.117A1.12 1.12 0 0 1 1 14.881v-.673a3.947 3.947 0 0 1 1.738-3.277A2.706 2.706 0 0 0 3.926 8.7V7.087a6.07 6.07 0 0 1 12.138 0l.01 1.613a2.7 2.7 0 0 0 1.189 2.235A3.949 3.949 0 0 1 19 14.208Zm-1.25 0a2.7 2.7 0 0 0-1.188-2.242A3.956 3.956 0 0 1 14.824 8.7V7.088a4.819 4.819 0 1 0-9.638 0v1.615a3.956 3.956 0 0 1-1.738 3.266 2.7 2.7 0 0 0-1.198 2.239v.542h15.5v-.542Z"></path>
              </svg>
            ''',
            color: Colors.black.withOpacity(0.6),
            height: 26,
            width: 26,
          ),
          label: 'Thông báo',
        ),
      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    bool isScreenExists = index > 0 && index < screens.length;
    if (isScreenExists) {
      switch (index) {
        case POSTS_SCREEN_INDEX:
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const PostsScreen()));
        case HELLO_SCREEN_INDEX:
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SecondScreen()));
        case CREATE_POST_SCREEN_INDEX:
          _showNewPostModal(context);
        case MESSAGE_SCREEN_INDEX:
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        case NOTIFICATIONS_SCREEN_INDEX:
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const InboxScreen()));
          break;
      }
    }
  }

  void _showNewPostModal(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height - 300;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return CreatePostPopupWindow(screenHeight: screenHeight);
      },
    );
  }
}

class NotificationOptionsPopupWindow extends StatelessWidget {
  final double screenHeight;

  const NotificationOptionsPopupWindow({super.key, required this.screenHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16,
      ),
      height: screenHeight,
      child: Column(
        children: [
          Container(
            width: 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.shade400,
                  width: 5.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Cài Đặt Thông Báo",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.shade300,
                  width: 1.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.remove_red_eye_outlined,
              color: Colors.black,
              size: 24,
            ),
            label: const Text(
              "Ẩn thông báo này",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 8),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.clear,
              color: Colors.black,
              size: 24,
            ),
            label: const Text(
              "Không nhận thông báo từ người này nữa",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 8),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_off_outlined,
              color: Colors.black,
              size: 24,
            ),
            label: const Text(
              "Tắt loại thông báo này",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade300,
                minimumSize: Size(1000, 50)),
            child: const Text(
              'Đóng',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
