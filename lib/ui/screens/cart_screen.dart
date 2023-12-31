import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../state_managers/bottom_nav_bar_controller.dart';
import '../state_managers/cart_controller.dart';
import '../utils/app_colors.dart';
import '../widgets/cart_product_item.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<CartController>().getCartList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: greyColor,
          ),
          onPressed: () {
            Get.find<BottomNavigationBarController>().backToHome();
          },
        ),
      ),
      body: GetBuilder<CartController>(builder: (cartController) {
        if (cartController.getCartListInProgress) {
          return const Center(
            child: CircularProgressIndicator(color: primaryColor,),
          );
        }
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartController.cartListModel.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return CartProductItem(
                    cartData: cartController.cartListModel.data![index],
                  );
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  )),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Total Price',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: softGreyColor),
                        ),
                        GetBuilder<CartController>(
                            builder: (cartController) {
                              // return Text('\$${cartController.totalPrice}',
                              //     style: const TextStyle(
                              //       fontSize: 18,
                              //       fontWeight: FontWeight.w500,
                              //       color: primaryColor,
                              //     ));
                              return const Text('\$4000.0',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: primaryColor,
                                  ));
                            }
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 120,
                      child: ElevatedButton(
                        onPressed: (){},
                        child: const Text('Checkout'),
                      )
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
