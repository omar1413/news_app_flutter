import 'package:flutter/material.dart';
import 'package:news_app/src/components/drawer.dart';
import 'package:news_app/src/components/header_text.dart';
import 'package:news_app/src/components/minor_text.dart';
import 'dart:math' as math;

class InstagramFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram Feed'),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      drawer: MyDrawer(),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return _FeedCard();
          },
          itemCount: 20,
        ),
      ),
    );
  }
}

class _FeedCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 50,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          buildCardHeader(padding : 16.0),
          SizedBox(height: 16.0),
          buildCardBody(context, padding: 16.0),
          SizedBox(height: 8.0),
          buildCardFooter(padding:16.0),
        ],
      ),
    );
  }

  Widget buildCardHeader({ double padding = 0}) {

    return Padding(
      padding:  EdgeInsets.only(right: padding, left: padding,top: padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 16.0),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.redAccent,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    HeaderText('Christina Meyers'),
                  ],
                ),
                MinorText('Fri,12 May 2017.14.30')
              ],
            ),
          ],),
          Row(
            children: <Widget>[
            _IconButton(
              padding: EdgeInsets.all(4.0),
              icon: Icon(Icons.favorite),
              onPressed: (){},
              color: Colors.grey,
            ),
            MinorText('25'),
          ],),

        ],
      ),
    );
  }

  Widget buildCardBody(BuildContext context,{double padding = 0}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: padding, left: padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              NormalText('we also talk about the future of work as robots',fontSize: 15.0,),
              SizedBox(height: 8.0),
              NormalText('#advance #rettro #instagram',
                fontSize: 15.0,
                color: Colors.amber,),
            ],
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: 8.0),
          height:MediaQuery.of(context).size.height / 3,
          width: double.infinity,
          decoration: BoxDecoration(color:Colors.grey),
        ),
      ],
    );
  }

  Widget buildCardFooter({double padding = 0}) {
    double iconSize = 30.0;
    double fontSize = 15.0;
    double buttonFontSize = 15.0;

    final btnColor = Colors.white.withAlpha(0);
    final btnHighlightColor = Colors.redAccent;
    final btnSplashColor = Colors.orangeAccent;

    const color = Colors.orangeAccent;
    return Padding(
      padding:  EdgeInsets.only(right: padding, left: padding,bottom: padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          NormalText('10 Comments',fontSize: 15.0,color: color,),
          Row(children: <Widget>[
            MaterialButton(
              minWidth: 0,
              elevation: 0,
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              onPressed: () {},
              color: btnColor,
              highlightColor: btnHighlightColor,
              splashColor: btnSplashColor,
              child: NormalText(
                'SHARE',
                color: color,
                fontSize: buttonFontSize,
              ),
            ),

            MaterialButton(
              minWidth: 0,
              elevation: 0,
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              onPressed: () {},
              color: btnColor,
              highlightColor: btnHighlightColor,
              splashColor: btnSplashColor,
              child: NormalText(
                'OPEN',
                color: color,
                fontSize: buttonFontSize,
              ),
            ),
          ],

          ),
        ],
      ),
    );
  }
}

class _IconButton extends StatelessWidget {
  final double iconSize;
  final EdgeInsetsGeometry padding;
  final Alignment alignment;
  final Icon icon;
  final Color color;
  final Color focusColor;
  final Color hoverColor;

  final Color highlightColor;

  final Color splashColor;
  final Color disabledColor;
  final VoidCallback onPressed;
  final bool autofocus;
  final FocusNode focusNode;
  final String tooltip;


  const _IconButton({
    Key key,
    this.iconSize = 24.0,
    this.padding = const EdgeInsets.all(8.0),
    this.alignment = Alignment.center,
    @required this.icon,
    this.color,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.disabledColor,
    @required this.onPressed,
    this.focusNode,
    this.autofocus = false,
    this.tooltip,
  }) : assert(iconSize != null),
        assert(padding != null),
        assert(alignment != null),
        assert(autofocus != null),
        assert(icon != null),
        super(key: key);


  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    Color currentColor;
    if (onPressed != null)
      currentColor = color;
    else
      currentColor = disabledColor ?? Theme.of(context).disabledColor;

    Widget result = ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 0, minHeight: 0),
      child: Padding(
        padding: padding,
        child: SizedBox(
          height: iconSize,
          width: iconSize,
          child: Align(
            alignment: alignment,
            child: IconTheme.merge(
              data: IconThemeData(
                size: iconSize,
                color: currentColor,
              ),
              child: icon,
            ),
          ),
        ),
      ),
    );

    if (tooltip != null) {
      result = Tooltip(
        message: tooltip,
        child: result,
      );
    }

    return Semantics(
      button: true,
      enabled: onPressed != null,
      child: Focus(
        focusNode: focusNode,
        autofocus: autofocus,
        child: InkResponse(
          onTap: onPressed,
          child: result,
          focusColor: focusColor ?? Theme.of(context).focusColor,
          hoverColor: hoverColor ?? Theme.of(context).hoverColor,
          highlightColor: highlightColor ?? Theme.of(context).highlightColor,
          splashColor: splashColor ?? Theme.of(context).splashColor,
          radius: math.max(
            Material.defaultSplashRadius,
            (iconSize + math.min(padding.horizontal, padding.vertical)) * 0.7,
            // x 0.5 for diameter -> radius and + 40% overflow derived from other Material apps.
          ),
        ),
      ),
    );
  }
}




