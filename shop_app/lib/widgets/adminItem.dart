import 'package:flutter/material.dart';
import '../screens/edit_screen.dart';
import 'package:provider/provider.dart';
import '../providers/products.provider.dart';

class AdminItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  AdminItem({this.id, this.title, this.imageUrl});

  @override
  build(BuildContext context) {
    final productStore = Provider.of<Products>(context, listen: false);
    final scaffoldMessenger = ScaffoldMessenger.of(context);

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
                onPressed: () async {
                  try {
                    await productStore.deleteProduct(id);
                  } catch (error) {
                    scaffoldMessenger.showSnackBar(SnackBar(
                      content: Text('Delete product failed'),
                    ));
                  }
                },
                icon: Icon(Icons.delete, color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
