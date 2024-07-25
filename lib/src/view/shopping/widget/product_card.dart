import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/src/model/product.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/theme/component/rating.dart';
import 'package:house_of_tomorrow/util/helper/intl_helper.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: context.color.surface,
        boxShadow: context.deco.shadow,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (product.productColorList.isNotEmpty)
            //자식 위젯을 자름
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                product.productColorList.first.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          const SizedBox(height: 4),
          Text(
            product.name.toString(),
            style: context.typo.headline4.copyWith(
              fontWeight: context.typo.semiBold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            product.brand.toString(),
            style: context.typo.body2.copyWith(
              fontWeight: context.typo.light,
              color: context.color.subtext,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Expanded(
                child: Text(
                    IntlHelper.currency(
                        symbol: product.priceUnit, number: product.price),
                    style: context.typo.subtitle2),
              ),
              Rating(rating: product.rating)
            ],
          )
        ],
      ),
    );
  }
}
