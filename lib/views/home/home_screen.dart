
import 'package:my_prj/Const/constants.dart';

import '../../Const/lists.dart';

import '../../widget_common/home_buttons.dart';
import 'components/featured_comp.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body:Container(
  padding: EdgeInsets.symmetric(horizontal: 10),
  child: Column(
    children: [
      10.heightBox,
      TextFormField(
        decoration: const InputDecoration(
          border: InputBorder.none,
          suffixIcon: Icon(Icons.search),
          filled: true,
          fillColor: whiteColor,
          hintText: searchanything,
          hintStyle: TextStyle(color: Colors.pinkAccent),
        ),
      ),
      10.heightBox,

      VxSwiper.builder(
        aspectRatio: 16 / 9,
        autoPlay: true,
        height: 150,
        enlargeCenterPage: true,
        itemCount: slidersList.length,
        itemBuilder: (context, index) {
          return Image.asset(
            slidersList[index],
            fit: BoxFit.fill,
          )
              .box.rounded.clip(Clip.antiAlias)
              .margin(const EdgeInsets.symmetric(horizontal: 8)).shadowSm
              .make();
        },
      ),
       20.heightBox,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          3,
          (index) => homeButtons(
            height: context.screenHeight * 0.15,
            width: context.screenWidth / 3.5,
            icon: index == 0 ? iccategories :index==1 ? icBrands: icTopSellers,
            title: index == 0 ? topCategories :index==1? brands: topSellers,
          ),
        ),
      ),
       20.heightBox,
      Align(
        alignment:Alignment.centerLeft,
        child:featuredCategories.text.color(pinkAccent).size(18).fontFamily(semibold).make(),
      ),
       10.heightBox,
      Row(
        children: [
          Expanded(
            child: Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics:const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    4,
                    (index) => Row(
                      children: [
                        featuredButton(icon: featuredImages[index], title: featuredTitles[index]),
                        10.widthBox,
                        15.heightBox
                      ],
                    ),
                  ).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
       10.heightBox,

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          2,
          (index) => homeButtons(
            height: context.screenHeight * 0.15,
            width: context.screenWidth / 2.2,
            icon: index == 0 ? icTodaysDeal : icFlashDeal,
            title: index == 0 ? todayDeal : flashsale,
          ),
        ),
      ),
       10.heightBox,

      // Row(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     featuredProducts.text.white.fontFamily(bold).size(18).make(),
      //     10.heightBox,
      //     SingleChildScrollView(
      //       scrollDirection: Axis.horizontal,
      //       child: Row(
      //         children: List.generate(
      //           6,
      //           (index) => Column(
      //             children:[
      //               Image.asset(
      //                 imgSlider1,
      //                 width:150,
      //                 fit:BoxFit.cover,
      //               ),
      //               const Spacer(),
      //               10.heightBox,
      //               "Wall Hanger".text.fontFamily(semibold).color(darkFontGrey).make(),
      //               10.heightBox,
      //               "\$5".text.fontFamily(bold).color(Colors.lightGreen).make(),
      //             ],
      //           ).box.white.margin(const EdgeInsets.symmetric(horizontal: 4)).roundedSM.padding(const EdgeInsets.all(8)).make(),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
       10.heightBox,
      
//     Expanded(
//       child: VxSwiper.builder(
//         aspectRatio: 16 / 8,
//         autoPlay: true,
//         height: 130,
//         enlargeCenterPage: true,
//         itemCount: sliders2List.length,
//         itemBuilder: (context, index) {
//           return Image.asset(
//             sliders2List[index],
//             fit: BoxFit.fill,
//           )
//               .box.clip(Clip.antiAlias)
//               .margin(const EdgeInsets.symmetric(horizontal: 0))
//               .shadowSm.roundedSM.make();
//         },
//       ),
//     ),

//     // ... Other widgets ...
//   ],
// )

      // GridView.builder(
      //   physics: NeverScrollableScrollPhysics(),
      //   shrinkWrap: true,
      //   itemCount: 6,
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2, mainAxisSpacing: 8, crossAxisSpacing:8),
      //   itemBuilder: (context,index){
      //     return Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children:[
      //         Image.asset(
      //           imgSlider2,
      //           width:150,
      //           fit:BoxFit.fill,
      //         ),
      //         10.heightBox,
      //         "Name".text.fontFamily(semibold).color(darkFontGrey).make(),
      //         10.heightBox,
      //         "Price".text.fontFamily(bold).color(Colors.pinkAccent).make(),
      //       ]
      //     ).box.white.margin(const EdgeInsets.symmetric(horizontal: 4)).roundedSM.padding(const EdgeInsets.all(8)).make();
      //   },
      // ),
    ]
  ),
      )
);
  }
}
