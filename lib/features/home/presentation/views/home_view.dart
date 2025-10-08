import 'package:e_commerce_task/core/constants/spacing.dart';
import 'package:e_commerce_task/features/home/presentation/bloc/product_cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_task/features/home/presentation/views/widgets/home_header.dart';
import 'package:e_commerce_task/features/home/presentation/views/widgets/home_greeting.dart';
import 'package:e_commerce_task/features/home/presentation/views/widgets/new_arrival_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(20),
              const HomeHeader(),
              verticalSpace(10),
              const HomeGreeting(),
              verticalSpace(20),
              BlocBuilder<ProductCubit, ProductState>(
                builder: (context, state) {
                  if (state is ProductLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ProductFailure) {
                    return Center(
                      child: Text(
                        state.errorMessage,
                        textAlign: TextAlign.center,
                      ),
                    );
                  } else if (state is ProductSuccess) {
                    return NewArrivalSection(products: state.products);
                  }
                  return const SizedBox();
                },
              ),
              verticalSpace(20),
            ],
          ),
        ),
      ),
    );
  }
}
