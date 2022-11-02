import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/cart_entity.dart';
import 'key_value_text_widget.dart';

class BasketWidget extends StatelessWidget {
  final CartItem cartEntity;
  const BasketWidget({super.key, required this.cartEntity});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed('/foodDetailsPage', arguments: cartEntity.foodEntity);
        },
        child: Container(padding: const EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade200)),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: CachedNetworkImage(
                      imageUrl: cartEntity.foodEntity.image.toString(),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: KeyValueWidgetText(
                  widgetTextKey: cartEntity.foodEntity.name.toString(),
                  widgetTextValue: "${cartEntity.foodEntity.price}\$",
                ),
              ),
              KeyValueWidgetText(
                widgetTextKey: "Quantity",
                widgetTextValue: cartEntity.quantity.toString(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
