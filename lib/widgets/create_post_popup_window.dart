import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePostPopupWindow extends StatefulWidget {
  final double screenHeight;

  const CreatePostPopupWindow({Key? key, required this.screenHeight}) : super(key: key);

  @override
  _CreatePostPopupWindowState createState() => _CreatePostPopupWindowState();
}

class _CreatePostPopupWindowState extends State<CreatePostPopupWindow> {
  String? _pickedImagePath;
  final ImagePicker _picker = ImagePicker();

  // Callback function when selecting an image
  void _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _pickedImagePath = pickedFile.path;
      });
    }
  }

  // Callback function when selecting a video
  void _pickVideo() {
    // Logic for picking a video
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          toolbarHeight: 80.0,
          leading: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          title: const Padding(
            padding:  EdgeInsets.only(top: 16.0),
            child: Text(
              'Tạo bài viết mới',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0, right: 16),
              child: TextButton(
                onPressed: () {
                  // Handling when the "Post" button is pressed
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),
                child: const Text(
                  'Đăng',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage("https://styles.redditmedia.com/t5_bbhq9/styles/profileIcon_snoo-nftv2_bmZ0X2VpcDE1NToxMzdfZjMzYWQ4NmJiNTRhMjc4YTZjOWY5YzA3NmY0ZWQ1YTM0YzUzMTk2N18zODYyMDM_rare_a41e6e1c-d338-4942-a195-814cea9236c6-headshot.png?width=64&height=64&frame=1&auto=webp&crop=64:64,smart&s=b17580b874344506766dca9268f88ae58f747d73"),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "thangphan",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: [
                          Icon(Icons.public, size: 18, color: Colors.grey),
                          SizedBox(width: 4),
                          Text(
                            "Công khai",
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const TextField(
                maxLines: 8,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Bạn đang nghĩ gì?',
                  hintStyle: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 10),
              _pickedImagePath != null
                  ? Image.file(File(_pickedImagePath!))
                  : SizedBox(),
              const SizedBox(height: 10),
              PickFileWidget(
                pickImage: _pickImage,
                pickVideo: _pickVideo,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PickFileWidget extends StatelessWidget {
  const PickFileWidget({Key? key, required this.pickImage, required this.pickVideo}) : super(key: key);

  final VoidCallback pickImage;
  final VoidCallback pickVideo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        Row(
          children: [
            const Icon(Icons.image, color: Colors.green,size:32),
            const SizedBox(width: 8),
            TextButton(
              onPressed: pickImage,
              child: const Text(
                'Chọn ảnh',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  ),
              ),
            ),
          ],
        ),
        const Divider(),
         Row(
          children: [
            const Icon(Icons.video_library, color: Colors.red,size:32),
            const  SizedBox(width: 8),
            TextButton(
              onPressed: pickVideo,
              child: const Text(
                'Chọn video',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        const Divider(),
        Row(
          children: [
            const Icon(Icons.camera_alt, color: Colors.blue, size: 32),
            const SizedBox(width: 8),
            TextButton(
              onPressed: pickImage,
              child: const Text(
                'Chọn camera',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  ),
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
