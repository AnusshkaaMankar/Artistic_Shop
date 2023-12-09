import '../Const/constants.dart';

class CartScreen extends StatelessWidget{
  const CartScreen ({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:
        AppBar(
          backgroundColor: pinkAccent,
          title: cart.text.fontFamily(bold).color(whiteColor).make(),

      ),
      body: Container(color: Colors.white,
    child:"Cart is Empty!".text.size(18).color(pinkAccent).fontFamily(bold).makeCentered()));}}