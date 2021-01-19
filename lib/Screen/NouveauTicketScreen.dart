import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sfr_designed/utls/color.dart';

class NouvTicketScreen extends StatefulWidget{
  @override
  _NouvTicketScreenState createState() => _NouvTicketScreenState();
}

class  _NouvTicketScreenState extends State<NouvTicketScreen>
{
  File _image;
  File _imageFile;
  final _picker = ImagePicker();
  int _selectindex =0;
  List _widgetOptions = [
    Text("Home"),
    Text("Message"),
    Text("profile")
  ];
  void _onItemTap(int index)
  {
    setState(() {
      _selectindex = index;
    });
  }

  Future<void> _pickImageFromGallery() async {
    final PickedFile pickedFile =
    await _picker.getImage(source: ImageSource.gallery);
    setState(() => this._imageFile = File(pickedFile.path));
  }

  Future<void> _pickImageFromCamera() async {
    final PickedFile pickedFile =
    await _picker.getImage(source: ImageSource.camera);
    setState(() => this._imageFile = File(pickedFile.path));
  }
 Widget _buildAppBar()
  {
    return SliverAppBar(
      //title: Text("Tableau opérationnel"),
      expandedHeight: 100.0,

      floating: true,
      pinned: true,
      snap: false,
      elevation: 5.0,
      shadowColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      flexibleSpace: new Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            stops: [0.4, 0.9],
            colors: [color_blueC,mainColor],
          ),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(90)
          ),
        ),
        child: FlexibleSpaceBar(
          title: Text("Nouveau Ticket", style: TextStyle(fontSize: 18), ),
          titlePadding: const EdgeInsets.only(left: 30.0, bottom: 35.0),
         // centerTitle: true,
          background: new ClipRect(
            child: new Container(
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(90)),

              ),
            ),
          ),
        ),
      ),

      actions: [
        IconButton(
         // padding: EdgeInsets.only(top: 0, right: 18),
            icon: Icon(Icons.logout,),iconSize: 30,
            alignment: Alignment.bottomCenter,onPressed: () {
          Navigator.pop(context);
        }),
      ],
    );
  }

  Widget _buildtitleTicket(){
   return Center(
      heightFactor: 5,
      child: Text("Ticket-numéro 123456",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
    );

  }

  Widget _buildZoneTitre()
  {
    return Column(
      children: [
      Container(
          height: 50,
          width: 300,

         child: Container(
            height: 45,
            width: MediaQuery.of(context).size.width/1.2,
            padding: EdgeInsets.only(
              top: 0,
              bottom: 0,
              left: 16.0,
              right: 16.0
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: color_white,
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5.0)]
            ),
            child: TextField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  hintText: "Titre",
                border: InputBorder.none
              ),
              cursorColor: color_blueC,
            ),

          )
      )

      ],
    );
  }
  Widget _buildZoneDesc(){
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 20),
            height: 250,
            width: 300,

            child: Container(
              height: 45,
              width: MediaQuery.of(context).size.width/1.2,
              padding: EdgeInsets.only(
                  top: 0,
                  bottom: 0,
                  left: 16.0,
                  right: 16.0
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: color_white,
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5.0)]
              ),
              child: TextField(
                maxLines: 20,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    hintText: "Déscription ticket",
                    border: InputBorder.none
                ),
                cursorColor: color_blueC,
              ),

            )
        )

      ],
    );
  }

  Widget _buildListImg()
  {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.grey
        ),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Center(
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 2,
                    color: Colors.grey
                ),
                borderRadius: BorderRadius.circular(30)
            ),
      )
      ),
    );
  }

  Widget _buildImgPicker(){

    return Column(
        children: [
    Container(

      padding: EdgeInsets.only(right: 100,top: 10),
         child: ButtonBar(

            children: <Widget>[
              FlatButton(onPressed: () async => _pickImageFromGallery(),
                  child: Row(
                    children: [

                      Icon(Icons.add_circle , color: color_blueC, size: 30,),
                      Text("Ajouter pièce jointe", style: TextStyle(fontFamily: "Segoe UI", color: color_blueC, fontSize: 15),),
                    ],
                  )
              ),
              /*IconButton(
              icon: const Icon(Icons.photo_camera),
              onPressed: () async => _pickImageFromCamera(),
              tooltip: 'Shoot picture',
            ),*/
              /*IconButton(
              icon: const Icon(Icons.photo),
              onPressed: () async => _pickImageFromGallery(),
              tooltip: 'Pick from gallery',
            ),*/
              _buildListImg() ]),
          ),
          if (this._imageFile == null)
            const Placeholder()
          else
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 2,
                      color: Colors.grey
                  ),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Center(
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: Colors.grey
                        ),
                        borderRadius: BorderRadius.circular(30)
                    ),

                  )
              ),
            ),


        ],

    );
  }


  Widget _buildBottomNav(){

    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        fixedColor: Colors.white,

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("data")),
          BottomNavigationBarItem(icon: Icon(Icons.handyman_rounded),title: Text("data")),
          BottomNavigationBarItem(icon: Icon(Icons.access_alarm_outlined),title: Text("data")),

        ],

        currentIndex: _selectindex,
        onTap: _onItemTap,
      ),
    );
  }


  _buildContent(){
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          _buildtitleTicket(),
          _buildZoneTitre(),
          _buildZoneDesc(),
          _buildImgPicker()
        ]
      ),
    );
  }

@override
Widget build(BuildContext context) {

  return Scaffold(
    backgroundColor: color_gray,
    body: CustomScrollView(
        slivers: <Widget>[
          _buildAppBar(),
          _buildContent(),

         // _buildBottomNav(),
        ]
    ),
  // bottomNavigationBar: _buildBottomNav(),

  );
}
}