// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:insta_image_viewer/insta_image_viewer.dart';

// class PostImageSlider extends StatefulWidget {

//   final List<String> images;

//   const PostImageSlider({
//     super.key,
//     required this.images,
//   });

//   @override
//   State<PostImageSlider> createState() => _PostImageSliderState();
// }

// class _PostImageSliderState extends State<PostImageSlider> {

//   bool isZoomed = false;
//   int currentPage = 0;

//   @override
//   Widget build(BuildContext context) {

//     return Column(
//       children: [

//         Stack(
//           children: [

//             SizedBox(
//               height: 380,
//               width: double.infinity,
//               child: PageView.builder(
//                 itemCount: widget.images.length,
//                 onPageChanged: (index){
//                   setState(() {
//                     currentPage = index;
//                   });
//                 },
//                 itemBuilder: (context,index){
//                   return InteractiveViewer(
//                      minScale: 1,
//                       maxScale: 4,
//                       clipBehavior: Clip.none,
//                       boundaryMargin: const EdgeInsets.all(20),
//                     child: CachedNetworkImage(
//                       imageUrl: widget.images[index],
//                       fit: BoxFit.cover,
//                       width: double.infinity,
//                       placeholder: (context, url) => Container(
//                         color: Colors.grey.shade300,
//                       ),
//                       errorWidget: (context, url, error) => const Icon(Icons.error),
//                     ),
//                   );
//                 },
//               ),
//             ),

//             /// PAGE COUNT (2/3)

//             if(widget.images.length > 1)
//               Positioned(
//                 right: 10,
//                 top: 10,
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 8,
//                     vertical: 4,
//                   ),
//                   decoration: BoxDecoration(
//                     color: Colors.black54,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Text(
//                     "${currentPage + 1}/${widget.images.length}",
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 12,
//                     ),
//                   ),
//                 ),
//               ),
//           ],
//         ),

//         /// DOT INDICATORS

//         if(widget.images.length > 1)
//           Padding(
//             padding: const EdgeInsets.only(top: 8),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: List.generate(
//                 widget.images.length,
//                 (index) => Container(
//                   margin: const EdgeInsets.symmetric(horizontal: 3),
//                   width: 6,
//                   height: 6,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: currentPage == index
//                         ? const Color(0xFF3897F0)
//                         : Colors.grey.shade300,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//       ],
//     );
//   }
// }

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PostImageSlider extends StatefulWidget {
  final List<String> images;

  const PostImageSlider({
    super.key,
    required this.images,
  });

  @override
  State<PostImageSlider> createState() => _PostImageSliderState();
}

class _PostImageSliderState extends State<PostImageSlider> {

  int currentPage = 0;
  bool isZoomed = false;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        Stack(
          children: [

            SizedBox(
              height: 380,
              width: double.infinity,
              child: PageView.builder(

                /// disable swipe while zooming
                physics: isZoomed
                    ? const NeverScrollableScrollPhysics()
                    : const BouncingScrollPhysics(),

                itemCount: widget.images.length,

                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },

                itemBuilder: (context, index) {

                  return InteractiveViewer(
                    minScale: 1,
                    maxScale: 4,
                    clipBehavior: Clip.none,
                    //boundaryMargin: const EdgeInsets.all(20),

                    /// detect zoom start
                    onInteractionStart: (details) {
                      setState(() {
                        isZoomed = true;
                      });
                    },

                    /// detect zoom end
                    onInteractionEnd: (details) {
                      setState(() {
                        isZoomed = false;
                      });
                    },

                    child: CachedNetworkImage(
                      imageUrl: widget.images[index],
                      fit: BoxFit.cover,
                      width: double.infinity,

                      placeholder: (context, url) => Container(
                        color: Colors.grey.shade300,
                      ),

                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  );
                },
              ),
            ),

            /// PAGE COUNT (1/3)
            if (widget.images.length > 1)
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "${currentPage + 1}/${widget.images.length}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
          ],
        ),

        /// DOT INDICATORS
        if (widget.images.length > 1)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.images.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentPage == index
                        ? const Color(0xFF3897F0)
                        : Colors.grey.shade300,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}