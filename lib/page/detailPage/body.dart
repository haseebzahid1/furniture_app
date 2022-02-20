//
// import 'package:flutter/material.dart';
// import 'package:furniture_app/constant.dart';
// import 'package:furniture_app/model/product.dart';
//
// class Body extends StatelessWidget {
//   final Product product;
//
//   const Body({Key? key, required this.product}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//
//     return SafeArea(
//       bottom: false,
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Container(
//               width: double.infinity,
//               padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
//               decoration: BoxDecoration(
//                 color: kBackgroundColor,
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(50),
//                   bottomRight: Radius.circular(50),
//                 ),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Center(
//                     child: Hero(
//                       tag: '${product.id}',
//                       child: ProductPoster(
//                         size: size,
//                         image: product.image,
//                       ),
//                     ),
//                   ),
//                   // ListOfColors(),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                         vertical: kDefaultPadding / 2),
//                     child: Text(
//                       product.title,
//                       style: Theme.of(context).textTheme.headline6,
//                     ),
//                   ),
//                   Text(
//                     '\$${product.price}',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                       color: kSecondaryColor,
//                     ),
//                   ),
//                   Padding(
//                     padding:
//                     EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
//                     child: Text(
//                       product.description,
//                       style: TextStyle(color: kTextLightColor),
//                     ),
//                   ),
//                   SizedBox(height: kDefaultPadding),
//                 ],
//               ),
//             ),
//             // ChatAndAddToCart(),
//           ],
//         ),
//       ),
//     );
//   }
//   Widget ProductPoster({required Size size,required String image}){
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
//       // the height of this container is 80% of our width
//       height: size.width * 0.8,
//
//       child: Stack(
//         alignment: Alignment.bottomCenter,
//         children: <Widget>[
//           Container(
//             height: size.width * 0.7,
//             width: size.width * 0.7,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               shape: BoxShape.circle,
//             ),
//           ),
//           Image.asset(
//             image,
//             height: size.width * 0.75,
//             width: size.width * 0.75,
//             fit: BoxFit.cover,
//           ),
//         ],
//       ),
//     );
//   }
// }
