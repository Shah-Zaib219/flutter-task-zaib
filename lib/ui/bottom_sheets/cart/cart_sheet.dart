import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../common/app_colors.dart';
import '../../common/ui_helpers.dart';
import 'cart_sheet_model.dart';

class CartSheet extends StackedView<CartSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const CartSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CartSheetModel viewModel,
    Widget? child,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: kcLightGrey,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          verticalSpaceMedium,
          Flexible(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: viewModel.cartItems.length,
              separatorBuilder: (context, index) =>
                  const Divider(color: kcCardBorderColor),
              itemBuilder: (context, index) {
                final item = viewModel.cartItems[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'USD ',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: kcPriceColor,
                                      fontFamily: 'SF Pro Display',
                                    ),
                                  ),
                                  TextSpan(
                                    text: item.bundle.price.toStringAsFixed(2),
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: kcPriceColor,
                                      fontFamily: 'SF Pro Display',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              '${item.bundle.dataAmount} / ${item.bundle.validity}',
                              style: const TextStyle(
                                fontSize: 13,
                                color: kcSubtitleColor,
                                fontFamily: 'SF Pro Display',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          border: Border.all(color: kcTitleColor, width: 1.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () =>
                                  viewModel.decrementQuantity(item.bundle.id),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.remove,
                                    size: 16, color: kcTitleColor),
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'x${item.quantity}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: kcTitleColor,
                                fontFamily: 'SF Pro Display',
                              ),
                            ),
                            const SizedBox(width: 4),
                            GestureDetector(
                              onTap: () =>
                                  viewModel.incrementQuantity(item.bundle.id),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.add,
                                    size: 16, color: kcTitleColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close,
                            color: Color(0xFFE57373), size: 24),
                        onPressed: () => viewModel.removeItem(item.bundle.id),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          verticalSpaceMedium,
          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              onPressed: () => completer?.call(SheetResponse(confirmed: true)),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1EC896),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'USD ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontFamily: 'SF Pro Display',
                      ),
                    ),
                    TextSpan(
                      text: viewModel.totalPrice.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'SF Pro Display',
                      ),
                    ),
                    const TextSpan(
                      text: ' - CHECKOUT',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontFamily: 'SF Pro Display',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          verticalSpaceSmall,
        ],
      ),
    );
  }

  @override
  CartSheetModel viewModelBuilder(BuildContext context) => CartSheetModel();
}
