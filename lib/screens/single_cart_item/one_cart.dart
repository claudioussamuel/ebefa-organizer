import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../models/UsersWhoBoughtTheTickectModel.dart';

class CartItemWidget extends StatelessWidget {
  final UsersWhoBoughtTheTickectModel cartItem;

  const CartItemWidget({Key? key, required this.cartItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: Wrap(
          direction: Axis.vertical,
          children: [
            Container(
              padding: EdgeInsets.only(left: 14),
              child: Text(
                cartItem.name ?? "",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: kPrimaryColor),
              ),
            ),
            Row(
              children: [
                Text(
                  cartItem.email ?? "",
                  style: TextStyle(color: kPrimaryLightColor),
                ),
              ],
            ),
          ],
        )),
        Padding(
          padding: const EdgeInsets.all(14),
          child: Text(
            cartItem.email ?? "",
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
