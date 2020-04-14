import 'package:chat_stream_example/page/channel_page.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ChannelListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Own id: ${StreamChat.of(context).user.id}');
    return Scaffold(
      body: ChannelListView(
        filter: {
          'members': {
            '\$in': [StreamChat.of(context).user.id],
          }
        },
        sort: [SortOption('last_message_at')],
        pagination: PaginationParams(
          limit: 20,
        ),
        channelWidget: ChannelPage(),
      ),
    );
  }
}
