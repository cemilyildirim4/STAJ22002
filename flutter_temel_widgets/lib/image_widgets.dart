import 'package:flutter/material.dart';

class ImageOrnekleri extends StatelessWidget {
  const ImageOrnekleri({super.key});
  @override
  Widget build(BuildContext context) {
    String _imgURL =
        'https://www.topgear.com/sites/default/files/cars-car/image/2016/07/2016-chevrolet-camaro-ss-049.jpg';

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    width: 150,
                    height: 150,
                    child: Image.asset(
                      "assets/images/car.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Expanded(
                  child: Container(
                    width: 150,
                    height: 150,
                    child: Image.asset(
                      "assets/images/car2.jpg",
                      fit: BoxFit.cover,
                    ),
                    color: Colors.red,
                  ),
                ),

                Expanded(
                  child: Container(
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/d.png"),
                      radius: 50,
                      backgroundColor: Colors.amber,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 200,
            child: FadeInImage.assetNetwork(
              placeholder: "assets/images/loading.gif",
              image: _imgURL,
            ),
          ),
          Placeholder(),
        ],
      ),
    );
  }
}
