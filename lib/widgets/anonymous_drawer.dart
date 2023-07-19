import 'package:flutter/material.dart';

class AnonymousDrawer extends StatelessWidget {
  const AnonymousDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Anônimo, fala aí seu frango!"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
