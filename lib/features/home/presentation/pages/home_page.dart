import '../../../../core/api_provider/utils.dart';
import '../../../../core/extensions/extentions.dart';
import '../bloc/home_states.dart';
import '../widgets/category_widget.dart';
import 'package:food_delivery/injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_events.dart';
import '../widgets/home_error_widget.dart';
import '../widgets/home_food_widget.dart';
import '../widgets/loading_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => di.services<HomeBloc>(),
        child: BlocBuilder<HomeBloc, HomeState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Utils.categories.length,
                      itemBuilder: (context, index) => CategoryWidget(
                        categoryName: Utils.categories[index].capitalize(),
                        isSelected: context.read<HomeBloc>().selectedCategoryIndex == index,
                        buttonAction: () {
                          if(context.read<HomeBloc>().selectedCategoryIndex != index){
                            context.read<HomeBloc>().add(SelectCategoryEvent(categoryIndex: index));
                            context.read<HomeBloc>().add(LoadFoodEvent(categoryName: Utils.categories[index]));
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Expanded(
                    flex: 15,
                    child: Builder(
                      builder: (context) {
                        if(state is FoodLoadedState){
                         return ListView.builder(
                                 itemCount: state.foodList.length,
                                 itemBuilder: (context, index) => Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: GestureDetector(
                                           onTap: () {
                                             Navigator.of(context).pushNamed('/foodDetailsPage', arguments: state.foodList[index]);
                                           },
                                           child: HomeFoodWidget(
                                               foodCategory: 
                                               Utils.categories[context.read<HomeBloc>().selectedCategoryIndex!.toInt()],
                                               foodModel: state.foodList[index],
                                     ),
                                   ),
                                 ),
                               );
                         } else if (state is FoodLoadingState) {
                        return const LoadingWidget();
                      } else if (state is FoodsErrorState) {
                        return HomeEmptyFoodList(widgetText: state.message);
                      } else {
                        return const HomeEmptyFoodList(widgetText: "Please select a category");
                      }
                    },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
