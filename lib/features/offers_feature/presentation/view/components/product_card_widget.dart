import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductCardWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String currentPrice;
  final String? originalPrice;
  final String salesCount;
  final bool isFavorite;
  final bool isVerified;
  final VoidCallback? onFavoritePressed;

  const ProductCardWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.currentPrice,
    this.originalPrice,
    required this.salesCount,
    this.isFavorite = false,
    this.isVerified = false,
    this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Section
          Expanded(
            flex: 5,
            child: SizedBox(
              width: 170,
              height: 215,
              child: Image.asset(
                width: 170,
                height: 215,
                imageUrl,
                fit: BoxFit.cover,

                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[200],
                    child: const Icon(
                      Icons.image_not_supported,
                      size: 40,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
          ),
          // Content Section
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Discount
                  Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      SvgPicture.asset(
                        alignment: Alignment.centerLeft,
                        'assets/Svgs/discount.svg',
                        width: 16.5,
                        height: 16.5,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "جاكيت من الصوف مناسب",
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 8),

                  // Price and Favorite Button
                  Row(
                    children: [
                      // Heart Icon
                      const SizedBox(width: 4),
                      // Orange Price Text (takes maximum available space)
                      Expanded(
                        flex: 3,
                        child: Text(
                          currentPrice,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFF95B1C),
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 4),
                      // Grey Price Text (gets remaining space)
                      Expanded(
                        flex: 1,
                        child: Text(
                          "/$originalPrice",
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.shade600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      InkWell(
                        onTap: onFavoritePressed,
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          size: 20,
                          color: isFavorite ? Colors.red : Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  // Sales Count
                  Row(
                    children: [
                      Icon(
                        Icons.local_fire_department,
                        size: 12,
                        color: Colors.grey.shade600,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "تم بيع $salesCount+",
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Bottom Icons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Badge(
                  backgroundColor: Colors.transparent,
                  offset: Offset(5, -5),
                  alignment: Alignment.topRight,

                  label: Icon(
                    Icons.check_circle,
                    size: 14,
                    color: Color(0xff0062E2),
                  ),

                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF0062E2).withAlpha(20),

                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.grey.shade200),
                    ),

                    child: Image.asset(
                      'assets/Vector.png',
                      width: 26,
                      height: 26,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 32,
                      height: 24,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: const Icon(Icons.add_shopping_cart, size: 16),
                    ),
                    const SizedBox(width: 15),
                    Image.asset(
                      'assets/company_logo.jpg',
                      width: 15,
                      height: 22,
                    ),
                    // Cart Icon

                    // Verified Badge
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
