import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twitter_clone/base_client.dart';
import 'package:twitter_clone/services/global_service.dart';
import 'package:twitter_clone/widgets/custom_snackbar.dart';
import 'package:http/http.dart' as http;

class CreatePostPopupWindow extends StatefulWidget {
  final double screenHeight;

  const CreatePostPopupWindow({super.key, required this.screenHeight});

  @override
  _CreatePostPopupWindowState createState() => _CreatePostPopupWindowState();
}

class _CreatePostPopupWindowState extends State<CreatePostPopupWindow> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  File? _image;

  Future<String> uploadImage(File? imageFile, String token) async {
    if (imageFile == null) {
      return '';
    }

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseURL/api/v1/upload'),
    );

    // Add the image file to the request
    request.files.add(
      http.MultipartFile(
        'file',
        imageFile.readAsBytes().asStream(),
        imageFile.lengthSync(),
        filename: imageFile.path.split('/').last,
      ),
    );

    // Add the authorization token to the request headers
    request.headers['Authorization'] = token;

    try {
      var response = await request.send();
      if (response.statusCode == 201) {
        print('Image uploaded successfully');
        var responseBody = await response.stream.bytesToString();
        var jsonResponse = jsonDecode(responseBody);
        print('Response body: $responseBody');
        var imageUrl = jsonResponse['metadata']['image_url'];
        return imageUrl;
      } else {
        print('Failed to upload image. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error uploading image: $e');
    }

    return '';
  }

  void handleCreatePost() async {
    try {
      // TODO: public the image first
      String title = _titleController.text;
      String content = _contentController.text;

      print("title: $title");
      print("content: $content");
      Map<String, dynamic>? userInfo =
          await GlobalService.getUserLoggedInInfo();
      String token = userInfo?['token'];
      print("token ahihi: $token");
      String imageURL = await uploadImage(_image, token);

      Map<String, dynamic> object = {
        "title": title,
        "content": content,
        "image_url": imageURL
      };

      var response = await BaseClient().post("/api/v1/post", object);
      print("response: $response");
      ScaffoldMessenger.of(context).showSnackBar(
        CustomSnackBar(
          message: 'Tạo bài viết mới thành công',
          color: Colors.green,
        ),
      );
    } catch (err) {
      print("err: $err");
    }
  }

  Future getImage() async {
    print("getImage");
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imageTemporary = File(image.path);
    setState(() {
      _image = imageTemporary;
    });
  }

  void _pickImage() async {}

  void _pickVideo() {}

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.screenHeight / 0.8,
      child: Scaffold(
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
              padding: EdgeInsets.only(top: 16.0),
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
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  child: InkWell(
                    onTap: () {
                      handleCreatePost();
                    },
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
                      backgroundImage: NetworkImage(
                          "https://styles.redditmedia.com/t5_bbhq9/styles/profileIcon_snoo-nftv2_bmZ0X2VpcDE1NToxMzdfZjMzYWQ4NmJiNTRhMjc4YTZjOWY5YzA3NmY0ZWQ1YTM0YzUzMTk2N18zODYyMDM_rare_a41e6e1c-d338-4942-a195-814cea9236c6-headshot.png?width=64&height=64&frame=1&auto=webp&crop=64:64,smart&s=b17580b874344506766dca9268f88ae58f747d73"),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "thangphan",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Row(
                          children: [
                            Icon(Icons.public, size: 18, color: Colors.grey),
                            SizedBox(width: 4),
                            Text(
                              "Công khai",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _titleController,
                  maxLines: 1,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Tiêu đề cho bài đăng của bạn là gì?',
                    hintStyle: TextStyle(fontSize: 20),
                  ),
                ),
                TextField(
                  controller: _contentController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Bạn đang nghĩ gì?',
                    hintStyle: TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(height: 10),
                _image != null
                    ? Image.file(
                        _image!,
                        // width: 250,
                        // height: 250,
                        fit: BoxFit.cover,
                      )
                    : const SizedBox(),
                const SizedBox(height: 10),
                PickFileWidget(
                  pickImage: getImage,
                  pickVideo: _pickVideo,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PickFileWidget extends StatelessWidget {
  const PickFileWidget(
      {super.key, required this.pickImage, required this.pickVideo});

  final VoidCallback pickImage;
  final VoidCallback pickVideo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        Row(
          children: [
            const Icon(Icons.image, color: Colors.green, size: 32),
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
            const Icon(Icons.video_library, color: Colors.red, size: 32),
            const SizedBox(width: 8),
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
              onPressed: () {},
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
