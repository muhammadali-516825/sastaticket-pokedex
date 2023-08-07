import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PokemonAvatar extends StatelessWidget {
  const PokemonAvatar({super.key, this.width=40, this.height=40, this.picUrl});
  final double width, height;
  final String? picUrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(picUrl!=null){
          showZoomablePicNetwork(picUrl!, context);
        }
      },
      child: ClipOval(
        child: picUrl==null? Icon(Icons.downloading, size: width,):
        CachedNetworkImage(
          fit: BoxFit.cover,
          width: width,
          height: height,
          imageUrl: picUrl!,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}

showZoomablePicNetwork(String url, BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return Stack(
        children: [
          Center(child: Container(
            color: Colors.transparent,
            width: MediaQuery.of(context).size.width-70,
            height: MediaQuery.of(context).size.width-70,
            child: PhotoView(
              tightMode: true,
              imageProvider: CachedNetworkImageProvider(
                url,
              ),
              //  customSize: Size(screenWidth/1.5, screenHeight/1.5),
            ),
          ),),
          //  Btn(onClicked: (){}, label: 'label')
        ],
      );
    },
  );
}