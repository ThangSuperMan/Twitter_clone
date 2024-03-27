import 'package:twitter_clone/helpers.dart';
import 'package:twitter_clone/theme.dart';
import 'package:twitter_clone/widgets_chats/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/page_chat/calls_page.dart';
import 'package:twitter_clone/page_chat/contacts_page.dart';
import 'package:twitter_clone/page_chat/messages_page.dart';
import 'package:twitter_clone/page_chat/notifications_page.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme().light,
      darkTheme: AppTheme().dark,
      themeMode: ThemeMode.light,
      title: 'Chatter',
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  final ValueNotifier<String> title = ValueNotifier('Đoạn chat');

  final pages = const [
    MessagePage(),
    NotificationPage(),
    CallsPage(),
    ContactsPage(),
  ];
  final pageTitles = const [
    'Đoạn chat',
    'Thông báo',
    'Cuộc gọi',
    'Liên hệ',
  ];

  void _onNavigationItemSelected(index) {
    title.value = pageTitles[index];
    pageIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: ValueListenableBuilder(
          valueListenable: title,
          builder: (BuildContext context, String value, _) {
            return Padding(
              padding:
                  const EdgeInsets.only(top: 16.0), // Thêm padding cho tiêu đề
              child: Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            );
          },
        ),
        leadingWidth: 54,
        leading: Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 24.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: IconBackground(
              icon: Icons.menu,
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0, right: 24),
            child: Avatar.small(url: Helpers.randomPictureUrl()),
          ),
        ],
      ),
      body: ValueListenableBuilder<int>(
        valueListenable: pageIndex,
        builder: (BuildContext context, int value, _) {
          return pages[value];
        },
      ),
      bottomNavigationBar: _BottomNavigationBar(
        onItemSelected: _onNavigationItemSelected,
      ),
    );
  }
}

class _BottomNavigationBar extends StatefulWidget {
  const _BottomNavigationBar({
    Key? key,
    required this.onItemSelected,
  }) : super(key: key);

  final ValueChanged<int> onItemSelected;

  @override
  _BottomNavigationBarState createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<_BottomNavigationBar> {
  var selectedIndex = 0;

  void handleItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Card(
      color: brightness == Brightness.light ? Colors.transparent : null,
      elevation: 0,
      margin: const EdgeInsets.all(0),
      child: SafeArea(
        top: false,
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 8, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavigationBarItem(
                index: 0,
                label: 'Đoạn chat',
                icon: CupertinoIcons.bubble_left_bubble_right_fill,
                isSelected: selectedIndex == 0,
                onTap: handleItemSelected,
              ),
              _NavigationBarItem(
                index: 1,
                label: 'Thông báo',
                icon: CupertinoIcons.bell_solid,
                isSelected: selectedIndex == 1,
                onTap: handleItemSelected,
              ),
              _NavigationBarItem(
                index: 2,
                label: 'Cuộc gọi',
                icon: CupertinoIcons.phone_fill,
                isSelected: selectedIndex == 2,
                onTap: handleItemSelected,
              ),
              _NavigationBarItem(
                index: 3,
                label: 'Liên lạc',
                icon: CupertinoIcons.person_2_fill,
                isSelected: selectedIndex == 3,
                onTap: handleItemSelected,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavigationBarItem extends StatelessWidget {
  const _NavigationBarItem({
    Key? key,
    required this.index,
    required this.label,
    required this.icon,
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);

  final int index;
  final String label;
  final IconData icon;
  final bool isSelected;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap(index);
      },
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 28,
              color: isSelected ? AppColors.secondary : null,
            ),
            SizedBox(height: 12),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? AppColors.secondary : null,
              ),
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
