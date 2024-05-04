import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter_clone/utils/colors.dart';

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
            onPressed: (){

            }, 
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
            onPressed: (){

            }, 
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
            onPressed: (){

            }, 
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
              minimumSize: Size(1000, 50)
            ),
            child: const Text(
              'Đóng',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: (){

            }, 
          ),
        ],
      ),
    );
  }
}
