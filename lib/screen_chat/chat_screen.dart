import 'package:twitter_clone/theme.dart';
import 'package:twitter_clone/models_chat/models.dart';
import 'package:twitter_clone/widgets_chats/widgets.dart';
import 'package:twitter_clone/widgets_chats/glowing_action_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  static Route route(MessageData data) => MaterialPageRoute(
        builder: (context) => ChatScreen(
          messageData: data,
        ),
      );

  const ChatScreen({Key? key, required this.messageData}) : super(key: key);

  final MessageData messageData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        centerTitle: false,
        elevation: 0,
        leadingWidth: 54,
        leading: Align(
          alignment: Alignment.centerRight,
          child: IconBackground(
            icon: CupertinoIcons.back,
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: _AppBarTitle(
          messageData: messageData,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Center(
              child: IconBorder(
                icon: CupertinoIcons.video_camera_solid,
                onTap: () {},
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Center(
              child: IconBorder(
                icon: CupertinoIcons.phone_solid,
                onTap: () {},
              ),
            ),
          )
        ],
      ),
      body: const Column(
        children: [
          Expanded(child: _DemoMessageList()), // Corrected instantiation of _DemoMessageList
          _ActionBar(),
        ],
      ),
    );
  }
}

class _DemoMessageList extends StatefulWidget {
  const _DemoMessageList({
    Key? key,
  }) : super(key: key);

  @override
  _DemoMessageListState createState() => _DemoMessageListState();
}

class _DemoMessageListState extends State<_DemoMessageList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView(
        children: const [
          _DataLabel(label: 'Hôm qua'),
          _MessageTile(
            message: 'Chào bạn, Ngày của bạn thế nào?',
            messageDate: '12:01 ',
          ),
          _MessageOwnTile(
            message: 'Bạn biết mọi thứ sẽ như thế nào...',
            messageDate: '12:01 ',
          ),
          _MessageTile(
            message: 'Bạn muốn Starbucks không?',
            messageDate: '12:02 ',
          ),
          _MessageOwnTile(
            message: 'Sẽ thú vị!',
            messageDate: '12:03 ',
          ),
          _MessageTile(
            message: 'Đi thôi!',
            messageDate: '12:03 ',
          ),
          _MessageOwnTile(
            message: 'Yay!',
            messageDate: '12:03 ',
          ),
        ],
      ),
    );
  }
}

class _MessageTile extends StatefulWidget {
  const _MessageTile({
    Key? key,
    required this.message,
    required this.messageDate,
  }) : super(key: key);

  final String message;
  final String messageDate;

  static const _borderRadius = 26.0;

  @override
  _MessageTileState createState() => _MessageTileState();
}

class _MessageTileState extends State<_MessageTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(_MessageTile._borderRadius),
                  topRight: Radius.circular(_MessageTile._borderRadius),
                  bottomRight: Radius.circular(_MessageTile._borderRadius),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.message,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 4),
            Text(
              widget.messageDate,
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).textTheme.caption!.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MessageOwnTile extends StatefulWidget {
  const _MessageOwnTile({
    Key? key,
    required this.message,
    required this.messageDate,
  }) : super(key: key);

  final String message;
  final String messageDate;

  static const _borderRadius = 26.0;

  @override
  _MessageOwnTileState createState() => _MessageOwnTileState();
}

class _MessageOwnTileState extends State<_MessageOwnTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Align(
        alignment: Alignment.centerRight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              decoration:const BoxDecoration(
                color:  AppColors.secondary,
                
                borderRadius:  BorderRadius.only(
                  topLeft: Radius.circular(_MessageOwnTile._borderRadius),
                  topRight: Radius.circular(_MessageOwnTile._borderRadius),
                  bottomLeft: Radius.circular(_MessageOwnTile._borderRadius),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.message,
                  style:const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 4),
            Text(
              widget.messageDate,
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).textTheme.caption!.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class _DataLabel extends StatefulWidget {
  const _DataLabel({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  _DataLabelState createState() => _DataLabelState();
}

class _DataLabelState extends State<_DataLabel> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12),
            child: Text(
              widget.label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppColors.textFaded,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AppBarTitle extends StatefulWidget {
  const _AppBarTitle({
    Key? key,
    required this.messageData,
  }) : super(key: key);

  final MessageData messageData;

  @override
  __AppBarTitleState createState() => __AppBarTitleState();
}

class __AppBarTitleState extends State<_AppBarTitle> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Avatar.small(
          url: widget.messageData.profilePicture,
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.messageData.senderName,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 5),
              const Text(
                'Đang hoạt động',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _ActionBar extends StatefulWidget {
  const _ActionBar({
    Key? key,
  }) : super(key: key);

  @override
  _ActionBarState createState() => _ActionBarState();
}

class _ActionBarState extends State<_ActionBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  width: 2,
                  color: Theme.of(context).dividerColor,
                ),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(
                CupertinoIcons.camera_fill,
              ),
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: TextField(
                style: TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  hintText: 'Nhập tin nhắn',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 24.0),
            child: GlowingActionButton(
              color: AppColors.accent,
              icon: Icons.send_rounded,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
