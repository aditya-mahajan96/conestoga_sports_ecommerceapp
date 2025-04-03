import 'package:etlaafinalproject/screens/CheckoutForm.dart';
import 'package:etlaafinalproject/utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
class Productsdetailscreen extends StatefulWidget {
  final SportsItemModel selectedItem;
  Productsdetailscreen({super.key, required this.selectedItem});

  @override
  State<Productsdetailscreen> createState() => _ProductsdetailscreenState();
}

class _ProductsdetailscreenState extends State<Productsdetailscreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: MyColors.checkColor,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              iconSize: 20.0,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: MyColors.blueColor,
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
          ),
          body: Stack(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 3,
                  child: Center(
                    child: CircleAvatar(
                      backgroundColor: MyColors.blueColor,
                      radius: MediaQuery.of(context).size.width * 0.30,
                      child: ClipOval(
                        child: Image.network(
                          fit: BoxFit.cover,
                          widget.selectedItem.productImage!,
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                        CommonTextWidget(
                          text: widget.selectedItem.productName!,
                          fontSize: Dimens.twenty,
                          fontWeight: FontWeight.w700,
                          fontColor: MyColors.blueColor,
                        ),
                        hSizedBox05,
                        CommonTextWidget(
                          text: widget.selectedItem.productManufacturer!,
                          fontSize: Dimens.sixteen,
                          fontWeight: FontWeight.w400,
                          fontColor: MyColors.blueColor,
                        ),
                        hSizedBox2,
                        CommonTextWidget(
                          height: 1.2,
                          text: widget.selectedItem.productDescription!,
                          fontSize: Dimens.fifteen,
                          fontWeight: FontWeight.w400,
                          fontColor: MyColors.blueColor,
                        ),
                        hSizedBox3,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.location_on_outlined, color: Colors.red),
                            TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),
                                onPressed: () {
                                  navigateTo();
                                },
                                child: Text(AppStrings.storenearme,
                                    style: TextStyle(
                                      fontSize: Dimens.sixteen,
                                      decoration: TextDecoration.underline,
                                    ))),
                          ],
                        ),
                      ])),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.all(Dimens.five),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CommonTextWidget(
                          text: AppStrings.totalAmount,
                          fontSize: Dimens.fifteen,
                          fontWeight: FontWeight.w400,
                          fontColor: Colors.black,
                        ),
                        CommonTextWidget(
                          text: AppStrings.dollarSign + widget.selectedItem.productPrice.toString(),
                          fontSize: Dimens.eighteen,
                          fontWeight: FontWeight.w800,
                          fontColor: Colors.black,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const CheckoutForm()));

                          },
                          child: CommonTextWidget(
                            text: AppStrings.buyNow,
                            fontSize: Dimens.sixteen,
                            fontWeight: FontWeight.w600,
                            fontColor: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ])),
    );
  }


  static void navigateTo() async {
    var uri = Uri.parse("google.navigation:q=42.493470,-92.343640&mode=d");
    if (await canLaunchUrl(Uri.parse(uri.toString()))) {
      await launchUrl(Uri.parse(uri.toString()));
    } else {
      throw 'Could not launch ${uri.toString()}';
    }
  }
}
