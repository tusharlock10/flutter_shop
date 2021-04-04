import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/Product.dart';
import '../providers/Products.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/product/edit';

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _imageUrlController = TextEditingController();
  final _form = GlobalKey<FormState>();
  Product _editingProduct = Product(
      id: null, title: null, description: null, price: null, imageUrl: null);

  void onSave() {
    if (this._form.currentState.validate()) {
      this._form.currentState.save();
      Provider.of<Products>(context, listen: false)
          .addProduct(this._editingProduct);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        actions: [IconButton(icon: Icon(Icons.save), onPressed: this.onSave)],
      ),
      body: Form(
        key: _form,
        child: ListView(
          padding: EdgeInsets.only(left: 10, right: 10),
          children: [
            TextFormField(
              autofocus: true,
              decoration: InputDecoration(labelText: 'Title'),
              textInputAction: TextInputAction.next,
              validator: (title) {
                if (title.isEmpty) {
                  return 'Please enter a title';
                }
                return null;
              },
              onSaved: (title) {
                this._editingProduct =
                    Product.copyWith(this._editingProduct, newTitle: title);
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Price'),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              validator: (price) {
                if (double.tryParse(price) == null) {
                  return 'Please enter a valid price';
                }
                return null;
              },
              onSaved: (price) {
                this._editingProduct = Product.copyWith(this._editingProduct,
                    newPrice: double.parse(price));
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Description'),
              keyboardType: TextInputType.multiline,
              onSaved: (description) {
                this._editingProduct = Product.copyWith(this._editingProduct,
                    newDescription: description);
              },
              maxLines: 3,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Image Url'),
                      keyboardType: TextInputType.url,
                      controller: this._imageUrlController,
                      onFieldSubmitted: (_) => this.setState(() {}),
                      onSaved: (imageUrl) {
                        this._editingProduct = Product.copyWith(
                            this._editingProduct,
                            newimageUrl: imageUrl);
                      },
                    ),
                  ),
                ),
                this._imageUrlController.text.isNotEmpty
                    ? (Container(
                        height: 100,
                        width: 100,
                        child: FittedBox(
                          child: Image.network(this._imageUrlController.text),
                          fit: BoxFit.contain,
                        ),
                      ))
                    : Container()
              ],
            )
          ],
        ),
      ),
    );
  }
}
