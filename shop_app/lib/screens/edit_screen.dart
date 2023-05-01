import 'package:flutter/material.dart';
import '../models/product.dart';
import 'package:provider/provider.dart';
import '../providers/products.provider.dart';

class EditScreen extends StatefulWidget {
  static final routeName = '/edit_product';

  @override
  EditScreenState createState() => EditScreenState();
}

class EditScreenState extends State<EditScreen> {
  final priceFocusNode = FocusNode();
  final descriptionFocusNode = FocusNode();
  final imageUrlController = TextEditingController();
  final form = GlobalKey<FormState>();
  var editProduct =
      Product(id: null, title: '', price: 0, description: '', imageUrl: '');
  var isInit = true;
  var isLoading = false;
  var isEditExistingProduct = false;
  var editProductItemId = null;
  var inItValues = {
    'title': '',
    'description': '',
    'imageUrl': '',
    'price': ''
  };

  @override
  void didChangeDependencies() {
    if (isInit) {
      final editProductId = ModalRoute.of(context).settings.arguments as String;

      if (editProductId != null) {
        editProduct = Provider.of<Products>(context, listen: false)
            .findById(editProductId);
        inItValues = {
          'title': editProduct.title,
          'description': editProduct.description,
          'imageUrl': '',
          'price': editProduct.price.toString()
        };
        imageUrlController.text = editProduct.imageUrl;
        isEditExistingProduct = true;
        editProductItemId = editProductId;
      }
    }
    isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    priceFocusNode.dispose();
    descriptionFocusNode.dispose();
    imageUrlController.dispose();
    super.dispose();
  }

  void saveForm(productsProvider) {
    final invalid = form.currentState.validate();
    if (!invalid) {
      return null;
    }

    form.currentState.save();
    setState(() {
      isLoading = true;
    });

    if (isEditExistingProduct) {
      Provider.of<Products>(context, listen: false)
          .updateProduct(editProductItemId, editProduct);
      setState(() {
        isLoading = false;
      });
      Navigator.of(context).pop();
    } else {
      productsProvider
          .addProduct(
        editProduct.title,
        editProduct.description,
        editProduct.imageUrl,
        editProduct.price,
      )
          .then((_) {
        setState(() {
          isLoading = false;
        });
        Navigator.of(context).pop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<Products>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        actions: [
          IconButton(
            onPressed: () {
              saveForm(productsProvider);
            },
            icon: Icon(Icons.save, color: Colors.green),
          )
        ],
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: EdgeInsets.all(6),
              child: Form(
                key: form,
                child: ListView(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Title'),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (value) {
                        print('test');
                        FocusScope.of(context).requestFocus(priceFocusNode);
                      },
                      initialValue: inItValues['title'],
                      validator: (value) {
                        print('test2');
                        if (value.isEmpty) {
                          return "Title is required";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        editProduct = Product(
                          id: null,
                          title: value,
                          price: editProduct.price,
                          description: editProduct.description,
                          imageUrl: editProduct.imageUrl,
                        );
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Price'),
                      initialValue: inItValues['price'],
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      focusNode: priceFocusNode,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context)
                            .requestFocus(descriptionFocusNode);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Price must not be empty';
                        }
                        if (double.parse(value) <= 0) {
                          return "Price must be above 0";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        editProduct = Product(
                          id: null,
                          title: editProduct.title,
                          price: double.parse(value),
                          description: editProduct.description,
                          imageUrl: editProduct.imageUrl,
                        );
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Description'),
                      initialValue: inItValues['description'],
                      maxLines: 5,
                      keyboardType: TextInputType.multiline,
                      focusNode: descriptionFocusNode,
                      onSaved: (value) {
                        editProduct = Product(
                          id: null,
                          title: editProduct.title,
                          price: editProduct.price,
                          description: value,
                          imageUrl: editProduct.imageUrl,
                        );
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Description is required';
                        }
                        if (value.length < 10) {
                          return "Description is too short";
                        }
                        return null;
                      },
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.only(top: 10, right: 10),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey),
                          ),
                          child: imageUrlController.text.isEmpty
                              ? Text("Enter a URL")
                              : FittedBox(
                                  child: Image.network(imageUrlController.text),
                                ),
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(labelText: 'Image URL'),
                            keyboardType: TextInputType.url,
                            textInputAction: TextInputAction.done,
                            controller: imageUrlController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'imageURL is required';
                              }
                              if (!value.startsWith('http') ||
                                  !value.startsWith('https')) {
                                return "Please enter a valid imageURL";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              editProduct = Product(
                                id: null,
                                title: editProduct.title,
                                price: editProduct.price,
                                description: editProduct.description,
                                imageUrl: value,
                              );
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
