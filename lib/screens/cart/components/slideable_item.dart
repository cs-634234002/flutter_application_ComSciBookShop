import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import 'package:flutter_application_lab1/models/cart.dart';
import 'package:flutter_application_lab1/providers/cart_provider.dart';
import 'package:flutter_application_lab1/screens/cart/components/cartitem.dart';

class SlideableItem extends StatelessWidget {
  final CartItem item;
  const SlideableItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Declare cartProvider
    final cartProvider = Provider.of<CartProvider>(context);
    return Slidable(
      endActionPane: ActionPane(
          motion: const ScrollMotion(),
          extentRatio: 0.35,
          children: [
            SlidableAction(
              onPressed: (context) {
                //Remove book from cart
                cartProvider.removeItem(item.bookId);
              },
              foregroundColor: Colors.red,
              icon: Icons.delete,
              label: 'Remove',
            ),
          ]),
      child: CartItemWidget(
          bookId: item.bookId,
          price: item.price,
          qty: item.qty,
          title: item.title,
          thumbnailUrl: item.thumbnailUrl),
    );
  }
}
