import 'package:flutter/material.dart';
import 'package:flutter_burclar/model/burc.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  final Burc secilenBurc;
  const BurcDetay({required this.secilenBurc, super.key});

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Color appbarRengi = Colors.transparent;
  late PaletteGenerator _generator;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print("init state çalıştı");

    WidgetsBinding.instance!.addPostFrameCallback((_) => appbarRenginiBul());
    /* _generator = PaletteGenerator.fromImageProvider(AssetImage(assetName)); */
  }

  @override
  Widget build(BuildContext context) {
    print("build çalıştı");
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,

            backgroundColor: appbarRengi,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.secilenBurc.burcAdi + " Burcu ve Özellikleri"),
              background: Image.asset(
                'images/' + widget.secilenBurc.burcBuyukResim,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Text(
                  widget.secilenBurc.burcDetayi,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void appbarRenginiBul() async {
    print("Build bitti baskın renk bulunacak");
    _generator = await PaletteGenerator.fromImageProvider(
      AssetImage("images/${widget.secilenBurc.burcBuyukResim}"),
    );
    appbarRengi = _generator.vibrantColor!.color;
    print("baskın renk bulundu build metodu tekrar calıstırılacak");
    setState(() {});
    print(appbarRengi);
  }
}
