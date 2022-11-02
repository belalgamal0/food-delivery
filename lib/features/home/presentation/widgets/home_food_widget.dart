import 'package:food_delivery/core/api_provider/utils.dart';
import 'package:food_delivery/core/theme/app_text_theme.dart';
import '../bloc/home_bloc.dart';
import 'add_button_widget.dart';
import '../../../../core/theme/app_color_theme.dart';
import '../../../../injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../basket/presentation/bloc/basket_bloc.dart';
import '../../../basket/presentation/bloc/basket_event.dart';
import '../../../favorite/presentation/bloc/favorite_bloc.dart';
import '../../../favorite/presentation/bloc/favorite_event.dart';
import '../../../favorite/presentation/bloc/favorite_state.dart';
import '../../domain/entity/food.dart';
import 'circular_image_widget.dart';

class HomeFoodWidget extends StatelessWidget {
  final Food foodModel;
  final String foodCategory;
  const HomeFoodWidget(
      {super.key, required this.foodModel, required this.foodCategory});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Row(
        children: [
          CircularImage(imageUr: foodModel.image.toString()),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                foodModel.name.toString(),
                style: AppTextTheme.black14Bold,
              ),
              const SizedBox(height: 10),
              WidgetAddButton(
                  buttonText: "add",
                  buttonAction: () {
                    context.read<BasketBloc>().add(UpdateBasketEvent(foodModel));
                  },
              ),
            ],
          ),
          const Spacer(),
          BlocProvider(
            create: (_) => di.services<FavoriteBloc>()..add(CheckFavoriteFoodEvent(foodKey: "$foodCategory${foodModel.id}", boxName: "cache")),
            child: BlocBuilder<FavoriteBloc, FavoriteState>(
              buildWhen: (previous, current) => previous != current,
              builder: (context, state) {
                return IconButton(
                    onPressed: () async {
                    context.read<FavoriteBloc>().add(
                          AddFoodFavoriteEvent(
                              categoryName: "$foodCategory${foodModel.id}",
                              boxName: Utils.hiveBoxCache),
                        );
                      context.read<FavoriteBloc>().add(
                          CheckFavoriteFoodEvent(
                              foodKey: "$foodCategory${foodModel.id}",
                              boxName: Utils.hiveBoxCache),
                        );
                    },
                    icon: Icon(BlocProvider.of<HomeBloc>(context).isFoodSetToFavorite(state) ? Icons.favorite: Icons.favorite_border,
                    color: AppColorTheme.appPimaryColor,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
