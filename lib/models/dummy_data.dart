import 'package:shop_app/models/store.dart';

import '../models/product.dart';
import '../models/brand.dart';

class DummyData {
  static List<Product> favProducts = [];

  static List<Product> getDummyProducts() {
    List<Product> dummyProducts = [];

    // Dummy product 1
    dummyProducts.add(
      Product(
        id: 1,
        price: 50.0,
        rating: 4.5,
        quantity: 10,
        description: 'Stylish Eyeglasses',
        store: Store(
          id: 1,
          name: 'Dummy Store 1',
          phoneNumber: '1234567890',
        ),
        brand: Brand(
          id: 1,
          name: 'Fashionable Eyewear Co.',
          countryOfOrigin: 'United States',
        ),
        model: 'Model A',
        color: 'Black',
        type: 'Fashion',
        gender: 'Unisex',
        border: 'Full Rim',
        shape: 'Round',
        imageUrls: [
          'https://static.zennioptical.com/production/products/general/32/12/3212315-eyeglasses-tinted-view.jpg',
          'https://static.zennioptical.com/production/products/general/32/12/3212315-eyeglasses-angle-view.jpg',
          'https://static.zennioptical.com/production/products/general/32/12/3212315-eyeglasses-side-view.jpg',
        ],
      ),
    );

    // Dummy product 2
    dummyProducts.add(
      Product(
        id: 2,
        price: 70.0,
        rating: 4.2,
        quantity: 8,
        description: 'Classic Eyeglasses',
        store: Store(
          id: 2,
          name: 'Dummy Store 2',
          phoneNumber: '9876543210',
        ),
        brand: Brand(
          id: 2,
          name: 'Retro Optics Inc.',
          countryOfOrigin: 'Italy',
        ),
        model: 'Model B',
        color: 'Brown',
        type: 'Classic',
        gender: 'Male',
        border: 'Semi Rimless',
        shape: 'Rectangle',
        imageUrls: [
          'https://static.zennioptical.com/production/products/general/32/20/3220621-eyeglasses-front-view.jpg',
          'https://static.zennioptical.com/production/products/general/32/20/3220621-eyeglasses-angle-view.jpg',
          'https://static.zennioptical.com/production/products/general/32/20/3220621-eyeglasses-angle-view.jpg',
        ],
      ),
    );

    // Dummy product 3
    dummyProducts.add(
      Product(
        id: 3,
        price: 60.0,
        rating: 4.7,
        quantity: 12,
        description: 'Trendy Eyeglasses',
        store: Store(
          id: 3,
          name: 'Dummy Store 3',
          phoneNumber: '0987654321',
        ),
        brand: Brand(
          id: 3,
          name: 'Trendy Optics Ltd.',
          countryOfOrigin: 'France',
        ),
        model: 'Model C',
        color: 'Blue',
        type: 'Trendy',
        gender: 'Female',
        border: 'Rimless',
        shape: 'Oval',
        imageUrls: [
          'https://static.zennioptical.com/production/products/general/12/56/125619-eyeglasses-tinted-view.jpg',
          'https://static.zennioptical.com/production/products/general/12/56/125619-eyeglasses-angle-view.jpg',
          'https://static.zennioptical.com/production/products/general/12/56/125619-eyeglasses-tinted-view.jpg',
          'https://static.zennioptical.com/production/products/general/12/56/125619-eyeglasses-tinted-view.jpg',
        ],
      ),
    );

    // Dummy product 4
    dummyProducts.add(
      Product(
        id: 4,
        price: 55.0,
        rating: 4.1,
        quantity: 7,
        description: 'Elegant Eyeglasses',
        store: Store(
          id: 4,
          name: 'Dummy Store 4',
          phoneNumber: '1234567890',
        ),
        brand: Brand(
          id: 4,
          name: 'Elegance Eyewear Ltd.',
          countryOfOrigin: 'Germany',
        ),
        model: 'Model D',
        color: 'Silver',
        type: 'Elegant',
        gender: 'Unisex',
        border: 'Full Rim',
        shape: 'Round',
        imageUrls: [
          'https://static.zennioptical.com/production/products/general/32/12/3212315-eyeglasses-tinted-view.jpg',
          'https://static.zennioptical.com/production/products/general/32/12/3212315-eyeglasses-angle-view.jpg',
          'https://static.zennioptical.com/production/products/general/32/12/3212315-eyeglasses-tinted-view.jpg',
          'https://static.zennioptical.com/production/products/general/32/12/3212315-eyeglasses-side-view.jpg',
        ],
      ),
    );

    // Dummy product 5
    dummyProducts.add(
      Product(
        id: 5,
        price: 65.0,
        rating: 4.6,
        quantity: 9,
        description: 'Sporty Eyeglasses',
        store: Store(
          id: 5,
          name: 'Dummy Store 5',
          phoneNumber: '0987654321',
        ),
        brand: Brand(
          id: 5,
          name: 'Active Vision Inc.',
          countryOfOrigin: 'United Kingdom',
        ),
        model: 'Model E',
        color: 'Red',
        type: 'Sporty',
        gender: 'Male',
        border: 'Semi Rimless',
        shape: 'Rectangle',
        imageUrls: [
          'https://static.zennioptical.com/production/products/general/32/12/3212315-eyeglasses-tinted-view.jpg',
          'https://static.zennioptical.com/production/products/general/32/12/3212315-eyeglasses-angle-view.jpg',
          'https://static.zennioptical.com/production/products/general/32/12/3212315-eyeglasses-side-view.jpg',
        ],
      ),
    );

    // Dummy product 6
    dummyProducts.add(
      Product(
        id: 6,
        price: 75.0,
        rating: 4.9,
        quantity: 15,
        description: 'Professional Eyeglasses',
        store: Store(
          id: 6,
          name: 'Dummy Store 6',
          phoneNumber: '1234567890',
        ),
        brand: Brand(
          id: 6,
          name: 'ProVision Eyewear Ltd.',
          countryOfOrigin: 'Canada',
        ),
        model: 'Model F',
        color: 'Gold',
        type: 'Professional',
        gender: 'Female',
        border: 'Rimless',
        shape: 'Oval',
        imageUrls: [
          'https://static.zennioptical.com/production/products/general/32/20/3220621-eyeglasses-angle-view.jpg',
          'https://static.zennioptical.com/production/products/general/32/20/3220621-eyeglasses-front-view.jpg',
          'https://static.zennioptical.com/production/products/general/32/20/3220621-eyeglasses-angle-view.jpg',
        ],
      ),
    );

    // Dummy product 7
    dummyProducts.add(
      Product(
        id: 7,
        price: 45.0,
        rating: 3.8,
        quantity: 5,
        description: 'Casual Eyeglasses',
        store: Store(
          id: 7,
          name: 'Dummy Store 7',
          phoneNumber: '0987654321',
        ),
        brand: Brand(
          id: 7,
          name: 'Casual Optics Inc.',
          countryOfOrigin: 'Australia',
        ),
        model: 'Model G',
        color: 'Green',
        type: 'Casual',
        gender: 'Unisex',
        border: 'Full Rim',
        shape: 'Round',
        imageUrls: [
          'https://static.zennioptical.com/production/products/general/32/20/3220621-eyeglasses-angle-view.jpg',
          'https://static.zennioptical.com/production/products/general/32/20/3220621-eyeglasses-angle-view.jpg',
          'https://static.zennioptical.com/production/products/general/32/20/3220621-eyeglasses-front-view.jpg',
        ],
      ),
    );

    // Dummy product 8
    dummyProducts.add(
      Product(
        id: 8,
        price: 80.0,
        rating: 5.0,
        quantity: 20,
        description: 'Designer Eyeglasses',
        store: Store(
          id: 8,
          name: 'Dummy Store 8',
          phoneNumber: '1234567890',
        ),
        brand: Brand(
          id: 8,
          name: 'Designer Eyewear Co.',
          countryOfOrigin: 'Spain',
        ),
        model: 'Model H',
        color: 'Purple',
        type: 'Designer',
        gender: 'Female',
        border: 'Rimless',
        shape: 'Cat Eye',
        imageUrls: [
          'https://static.zennioptical.com/production/products/general/32/20/3220621-eyeglasses-front-view.jpg',
          'https://static.zennioptical.com/production/products/general/32/20/3220621-eyeglasses-angle-view.jpg',
          'https://static.zennioptical.com/production/products/general/32/20/3220621-eyeglasses-front-view.jpg',
          'https://static.zennioptical.com/production/products/general/32/20/3220621-eyeglasses-angle-view.jpg',
        ],
      ),
    );

    return dummyProducts;
  }
}
