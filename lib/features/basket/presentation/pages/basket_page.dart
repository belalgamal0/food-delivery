import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/basket_bloc.dart';
import '../bloc/basket_state.dart';
import '../widgets/basket_widget.dart';
import '../widgets/empty_basket_widget.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BasketBloc, BasketState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          if (BlocProvider.of<BasketBloc>(context).basketItems.isEmpty) {
            return const EmptyBasketWidget();
          } else {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              itemCount: BlocProvider.of<BasketBloc>(context).basketItems.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 7.5),
                child: BasketWidget(
                  cartEntity:  BlocProvider.of<BasketBloc>(context).basketItems[index]
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
