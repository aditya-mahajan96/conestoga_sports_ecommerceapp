import 'package:etlaafinalproject/screens/ProductsDetailScreen.dart';
import 'package:etlaafinalproject/utils/constants.dart';
import 'package:flutter/material.dart';


class Productslistscreen extends StatefulWidget {
  const Productslistscreen({super.key});

  @override
  State<Productslistscreen> createState() => _ProductslistscreenState();
}


class _ProductslistscreenState extends State<Productslistscreen> {
  List<SportsItemModel> _sportsProductItems = [];

  @override
  void initState() {
    // TODO: implement initState
    _fetchSportsProductItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: MyColors.checkColor,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: MyColors.blueColor,
              title: Center(child: CommonTextWidget(text: AppStrings.productsList, fontSize: Dimens.eighteen, fontWeight: FontWeight.w600, fontColor: Colors.white)),
              actions: <Widget>[
                PopupMenuButton<String>(
                  icon: const Icon(Icons.filter_alt_rounded, color: Colors.white),
                  onSelected: handleClick,
                  itemBuilder: (BuildContext context) {
                    return {AppStrings.sortByRelevance, AppStrings.sortByName}.map((String choice) {
                      return PopupMenuItem<String>(
                        value: choice,
                        child: Text(choice),
                      );
                    }).toList();
                  },
                ),
              ],
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                hSizedBox2,
                _sportsProductItems.isNotEmpty?Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount:  _sportsProductItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _showPerShoeItem(_sportsProductItems[index]);
                      }),
                ):SizedBox(),

              ],
            )));
  }



  Widget _showPerShoeItem(SportsItemModel sportsProductItem)
  {
      return InkWell(

          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Productsdetailscreen(selectedItem: sportsProductItem))),

        child: Container(
          decoration: BoxDecoration(color: MyColors.hintColor, borderRadius: const BorderRadius.all(Radius.circular(20))),
          margin: const EdgeInsets.symmetric(vertical: Dimens.five, horizontal: Dimens.ten),
          padding: const EdgeInsets.all(Dimens.five),
          child: Row(
            children: [
              wSizedBox,
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: Dimens.fifty,
                child: ClipOval(
                  child: Image.network(
                    sportsProductItem.productImage.toString(),
                    fit: BoxFit.contain, // This will scale the image so it's fully visible, no cropping
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
              wSizedBox2,
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    hSizedBox05,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(flex: 1, child: CommonTextWidget(text:   sportsProductItem.productName!, overflow: TextOverflow.ellipsis, fontSize: Dimens.eighteen, fontWeight: FontWeight.w600, fontColor: MyColors.blueColor)),
                        wSizedBox,
                        Flexible(
                          flex: 1,
                          child: CommonTextWidget(text:AppStrings.dollarSign+ "${sportsProductItem.productPrice.toString()}", overflow: TextOverflow.ellipsis, fontSize: Dimens.sixteen, fontWeight: FontWeight.w600, fontColor: MyColors.blueColor),
                        ),
                      ],
                    ),
                    hSizedBox05,
                    CommonTextWidget(text:   sportsProductItem.productDescription!, overflow: TextOverflow.ellipsis, maxLines: 2, fontSize: Dimens.sixteen, fontWeight: FontWeight.w400, fontColor: MyColors.blueColor),
                  ],
                ),
              ),
              wSizedBox05,
              const Icon(Icons.arrow_forward_ios_outlined),
              wSizedBox2,
            ],
          ),
        ),
      );


  }

  _fetchSportsProductItems() async {
    _sportsProductItems.clear();

    DatabaseReference usersRef = FirebaseDatabase.instance.ref('etlaasportsworld');
    print('Database Reference: ${usersRef.path}');  // This will print the path you're trying to access

    usersRef.onValue.listen((event) {
      final dataSnapshot = event.snapshot.value;

      // Check if dataSnapshot is null or empty
      if (dataSnapshot == null) {
        print("No data found in the database.");
      } else {
        // Print the raw data snapshot for debugging
        print("Raw data snapshot: $dataSnapshot");

        // Check if the dataSnapshot is a List
        if (dataSnapshot is List) {
          // Skip the first null element (if present)
          for (int i = 1; i < dataSnapshot.length; i++) {
            final value = dataSnapshot[i];
            if (value is Map) {
              SportsItemModel sportsItem = SportsItemModel(
                productId: value['productId']?.toString() ?? '',
                productName: value['productName']?.toString() ?? '',
                productDescription: value['productDescription']?.toString() ?? '',
                productImage: value['productImage']?.toString() ?? '',
                productManufacturer: value['productManufacturer']?.toString() ?? '',
                productPrice: value['productPrice']?.toString() ?? '',
              );

              _sportsProductItems.add(sportsItem);
            }
          }

          // Print the first item's description for debugging
          if (_sportsProductItems.isNotEmpty) {
            print('First item description: ${_sportsProductItems[1].productDescription ?? 'No description'}');
          } else {
            print('No items found in the list.');
          }
        } else {
          print("Data is not in the expected List format.");
        }
      }

      setState(() {}); // Update the UI after the data is fetched
    });
  }





  void handleClick(String value) {
    switch (value) {
      case AppStrings.sortByRelevance:
        log("Sort by Relevance");
        setState(() {
          _sportsProductItems.shuffle();
        });

        break;
      case AppStrings.sortByName:
        log("Sort by Name");
        setState(() {
          _sportsProductItems.sort((a, b) => a.productName!.compareTo(b.productName!));
        });
        break;
    }
  }
}
