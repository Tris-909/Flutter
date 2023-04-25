import 'package:flutter/material.dart';

class AdminItem extends StatelessWidget {
  final String title;
  final String imageUrl;

  AdminItem({this.title, this.imageUrl});

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
                onPressed: null, icon: Icon(Icons.edit, color: Colors.blue)),
            IconButton(
                onPressed: null, icon: Icon(Icons.delete, color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
