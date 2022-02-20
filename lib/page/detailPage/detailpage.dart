import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/constant.dart';
import 'package:furniture_app/model/product.dart';
import 'package:furniture_app/page/detailPage/body.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        leading: IconButton(
          padding: EdgeInsets.only(left: kDefaultPadding),
          icon: SvgPicture.asset("assets/icons/back.svg"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: false,
        title: Text(
          'Back'.toUpperCase(),
          style: Theme.of(context).textTheme.bodyText2,
        ),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset('assets/icons/cart_with_item.svg'),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          decoration: const BoxDecoration(
            color: kBackgroundColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Hero(
                  tag: '${product.id}',
                  child: productPoster(
                    size: size,
                    image: product.image,
                  ),
                ),
              ),
              listOfColor(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                child: Text(
                  product.title,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Text(
                '\$${product.price}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: kSecondaryColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                child: Text(
                  product.description,
                  style: TextStyle(color: kTextLightColor),
                ),
              ),
              const SizedBox(height: kDefaultPadding),
              chatAndAddToCart(),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),

    );
  }

  Widget productPoster({required Size size, required String image}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
      // the height of this container is 80% of our width
      height: size.width * 0.8,

      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            height: size.width * 0.7,
            width: size.width * 0.7,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          Image.asset(
            image,
            height: size.width * 0.75,
            width: size.width * 0.75,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

///// colorWidget
  Widget colorDot({bool isSelected =false, required Color fillColor}) {
    return Container(
      margin:
          // left and right padding 8
          const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2.5),
      padding: const EdgeInsets.all(3),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? const Color(0xFF707070) : Colors.transparent,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: fillColor,
        ),
      ),
    );
  }
  Widget listOfColor (){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          colorDot(
            fillColor: Color(0xFF80989A),
            isSelected: true,
          ),
          colorDot(
            fillColor: Color(0xFFFF5200),
          ),
          colorDot(
            fillColor: kPrimaryColor,
          ),
        ],
      ),
    );
  }
  Widget chatAndAddToCart(){
    return Container(
      // margin: EdgeInsets.all(14),
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: Color(0xFFFCBF1E),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: <Widget>[
          SvgPicture.asset(
            "assets/icons/chat.svg",
            height: 18,
          ),
          const SizedBox(width: kDefaultPadding / 2),
          Text(
            "Chat",
            style: TextStyle(color: Colors.white),
          ),
          const Spacer(),
          // it will cover all available spaces
          GestureDetector(
            onTap: (){
              print("ok");
            },
            child: Row(
              children: [
                Text("Add to Cart",style: TextStyle(color: Colors.white),) ,
                SizedBox(width: 10,),
                SvgPicture.asset("assets/icons/shopping-bag.svg",height: 18,)
              ],
            ),
          ),

        ],
      ),
    );
  }
}
