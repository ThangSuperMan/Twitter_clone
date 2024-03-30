import 'package:flutter/material.dart';
import 'package:twitter_clone/utils/colors.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      'https://googleflutter.com/sample_image.jpg'),
                ),
                SizedBox(
                  height: 0,
                ),
                Text('Nguyễn Phú Hùng'),
                Text('20dh111995@st.huflit.edu.vn'),
                Text('2 Đang theo dõi   0 Được theo dõi'),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Cá nhân'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail),
            title: const Text('Đăng ký thành viên đặc biệt'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
              leading: const Icon(Icons.bookmark),
              title: const Text('Danh sách đã lưu'),
              onTap: () {
                Navigator.pop(context);
              }),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Giao diện'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.monetization_on_sharp),
            title: const Text('Kiếm tiền'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(
            color: Colors.black,
          ),
          ListTile(
            title: const Text('Cài đặc và hỗ trợ'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
