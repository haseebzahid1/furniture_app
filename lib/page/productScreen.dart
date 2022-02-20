import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/constant.dart';
import 'package:furniture_app/model/product.dart';
import 'package:furniture_app/page/detailPage/detailpage.dart';


class ProductsScreen extends StatefulWidget {
   ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  int selectedIndex = 0;
  List categories = ['All', 'Sofa', 'Park bench', 'Armchair'];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return  Scaffold(
        backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text('Dashboard'),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset("assets/icons/notification.svg"),
            onPressed: () {},
          ),
        ],
      ),
        body: Column(
        children: [
          searchBox(onChanged: (value){}),
          productListView(),
          stack(),
        ],
    ),
    );
  }

  //SearchBox widget
  Widget searchBox({Function(String)? onChanged}){
    return Container(
      margin: EdgeInsets.all(kDefaultPadding),
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 4, // 5 top and bottom
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        onChanged: onChanged,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          icon: SvgPicture.asset("assets/icons/search.svg"),
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget productListView(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              left: kDefaultPadding,
              right: index == categories.length - 1 ? kDefaultPadding : 0,
            ),
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            decoration: BoxDecoration(
              color: index == selectedIndex
                  ? Colors.white.withOpacity(0.4)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              categories[index],
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Widget stack(){
    return Expanded(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30),
              decoration: const BoxDecoration(
                color: kBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: products.length,
                itemBuilder: (context, index){
                  Product productItem = products[index];
                  return  Container(

                    margin: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding,
                      vertical: kDefaultPadding / 2,
                    ),
                    // color: Colors.blueAccent,
                    height: 160,
                    child: InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailsScreen(
                          product:productItem
                        )));
                      },
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: <Widget>[
                          // Those are our background
                          Container(
                            height: 136,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              color:kBlueColor ,
                              boxShadow: [kDefaultShadow],
                            ),
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(22),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Hero(
                              tag: "${productItem.id}",
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                                height: 160,
                                width: 200,
                                child: Image.asset(
                                  "${productItem.image}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                              left: 20,
                              top: 40,
                              child: Text("${productItem.title}",
                                style: Theme.of(context).textTheme.button,
                              )
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding * 1.5, // 30 padding
                                vertical: kDefaultPadding / 4, // 5 top and bottom
                              ),
                              decoration: const BoxDecoration(
                                color: kSecondaryColor,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(22),
                                  topRight: Radius.circular(22),
                                ),
                              ),
                              child: Text(
                                "565",
                                style: Theme.of(context).textTheme.button,
                              ),
                            ),
                          ),
                          // our product image
                        ],
                      ),
                    ),
                  );
                },

              ),
            ),
          ],
        )
    );
  }
}
