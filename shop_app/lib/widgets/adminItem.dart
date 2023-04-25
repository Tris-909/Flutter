import 'package:flutter/material.dart';
import '../screens/edit_screen.dart';

class AdminItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  AdminItem({this.id, this.title, this.imageUrl});

  @override
  build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(EditScreen.routeName, arguments: id);
                },
                icon: Icon(Icons.edit, color: Colors.blue)),
            IconButton(
                onPressed: null, icon: Icon(Icons.delete, color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
