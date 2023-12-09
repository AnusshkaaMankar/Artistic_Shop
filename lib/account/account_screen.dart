import 'package:my_prj/Const/lists.dart';

import '../Const/constants.dart';
class AccountScreen extends StatelessWidget{
  const AccountScreen ({Key? key}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pinkAccent,
                  title: account.text.fontFamily(bold).white.make(),

      ),
      body:Container(
        color:whiteColor,
         padding: const EdgeInsets.all(8),
         child:Column(children:[
         const Align( alignment:Alignment.topRight,
         child: Icon(Icons.edit,color:pinkAccent)).onTap(() {},),
          Row(children: [
            Image.asset(
              icaccount,
              width:100,
              fit:BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make(),
              10.widthBox,
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "Anushka Mankar".text.fontFamily(semibold).size(18).color(pinkAccent).make(),
                  5.heightBox,
                  "anushk30@gmail.com".text.fontFamily(semibold).color(Colors.black).make(),
                ],
              ))
,              OutlinedButton(style: OutlinedButton.styleFrom(
                side:const BorderSide(
                  color:pinkAccent
                )
              ),
              onPressed:(){} ,
              child:logout.text.fontFamily(semibold).color(pinkAccent).make()
                    )          ]
            ),
            20.heightBox,
           Row(children: [ Column(
              children: [
                "0".text.fontFamily(semibold).size(18).white.make(),
                5.heightBox,
                "In your Cart".text.fontFamily(semibold).size(18).white.make(),
              ],
            ).box.color(pinkAccent).rounded.width(context.screenWidth/3.3).height(60).padding(const EdgeInsets.all(4)).make(),
            5.widthBox,
          Column(
              children: [
                "16".text.fontFamily(semibold).size(18).white.make(),
                5.heightBox,
                "Total Orders".text.fontFamily(semibold).size(18).white.make(),
              ],
            ).box.color(pinkAccent).rounded.width(context.screenWidth/3.3).height(60).padding(const EdgeInsets.all(4)).make(),
                     5.widthBox,
                   Column(
              children: [
                "7".text.fontFamily(semibold).size(18).white.make(),
                5.heightBox,
                "In Wishlist".text.fontFamily(semibold).size(18).white.make(),
              ],
            ).box.color(pinkAccent).rounded.width(context.screenWidth/3.3).height(60).padding(const EdgeInsets.all(4)).make()  
        ],),  

        20.heightBox,
        ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (context,index){
            return const Divider(
              color:lightGrey
            );
          },
          itemCount:profileButtonList.length ,
          itemBuilder: (BuildContext context ,int index){
            return ListTile(
              //leading: Image.asset(profileButtonIcon[index]),
              title: profileButtonList[index].text.make(),
            );
          }  ).box.white.rounded.padding(const EdgeInsets.symmetric(horizontal: 16,vertical: 5)).shadowSm.make()     
],),
    
         ),
      );
       }
    }