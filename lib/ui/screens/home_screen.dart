import 'package:ecommerce_shopanbd/ui/utils/app_colors.dart';
import 'package:ecommerce_shopanbd/ui/widgets/product_details/category_card_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/home/appbar_icons.dart';
import '../widgets/home/home_carousal_widget.dart';
import '../widgets/home/home_remarks.dart';
import '../widgets/home/search_textfield.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: Image.asset(
          'assets/App_Logo.jpg',
        ),
        title: Row(
          children: [
            const Text(
              'ShopanBD',
              style: TextStyle(
                color: primaryColor,
                fontSize: 24,
              ),
            ),
            const Spacer(),
            AppBarIcons(
              icon: Icons.person,
              onTap: () {},
            ),
            const SizedBox(
              width: 10,
            ),
            AppBarIcons(
              icon: Icons.call,
              onTap: () {},
            ),
            const SizedBox(
              width: 10,
            ),
            AppBarIcons(
              icon: Icons.notifications,
              onTap: () {},
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SearchTextField(),
              const SizedBox(
                height: 16,
              ),
              HomeCaruosalWidget(),
              const SizedBox(
                height: 16,
              ),
              Remarks(
                title: 'All Categories',
                onTap: () {},
              ),
              const SizedBox(
                height: 16,
              ),
              const SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CategoryCardWidget(
                        name: 'name', imageUrl: Icons.computer, id: 1),
                    CategoryCardWidget(
                        name: 'name', imageUrl: Icons.computer, id: 1),
                    CategoryCardWidget(
                        name: 'name', imageUrl: Icons.computer, id: 1),
                    CategoryCardWidget(
                        name: 'name', imageUrl: Icons.computer, id: 1),
                    CategoryCardWidget(
                        name: 'name', imageUrl: Icons.computer, id: 1),
                    CategoryCardWidget(
                        name: 'name', imageUrl: Icons.computer, id: 1),
                    CategoryCardWidget(
                        name: 'name', imageUrl: Icons.computer, id: 1),
                    CategoryCardWidget(
                        name: 'name', imageUrl: Icons.computer, id: 1),
                    CategoryCardWidget(
                        name: 'name', imageUrl: Icons.computer, id: 1),
                    CategoryCardWidget(
                        name: 'name', imageUrl: Icons.computer, id: 1),
                    CategoryCardWidget(
                        name: 'name', imageUrl: Icons.computer, id: 1),
                    CategoryCardWidget(
                        name: 'name', imageUrl: Icons.computer, id: 1),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Remarks(
                title: 'Popular',
                onTap: () {},
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  children: [
                    ProductCart(),
                    ProductCart(),
                    ProductCart(),
                    ProductCart(),
                    ProductCart(),
                    ProductCart(),

                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Remarks(
                title: 'Special',
                onTap: () {},
              ),
              const SizedBox(
                height: 16,
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  children: [
                    ProductCart(),
                    ProductCart(),
                    ProductCart(),
                    ProductCart(),
                    ProductCart(),
                    ProductCart(),

                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Remarks(
                title: 'New',
                onTap: () {},
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  children: [
                    ProductCart(),
                    ProductCart(),
                    ProductCart(),
                    ProductCart(),
                    ProductCart(),
                    ProductCart(),

                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


