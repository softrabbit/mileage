# mileage

Polttoaineenkulutuslaskuri.

## Teknologiat
Flutter/Dart, Windows-pohjalla kehitetty.

## Pystytys ja käynnistys
Olettaen että flutter-ympäristö on asennettu ja toimii, ratkaisua voi
kokeilla koodin huipulta käskyllä `flutter run -d [chrome|edge]`, jolloin 
laskin käynnistyy selaimeen.

Koodin voi myös kääntää käskemällä koodin huipulta `flutter build web`,
jolloin kansioon `build/web` kääntyy itsenäinen staatinen web-versio, jonka voi 
julkaista www-serverillä. `index.html` on laskurin aloituskohta. Oletuksena
käyttöliittymä täyttää koko ikkunan leveyden, sen välttämiseksi laskurin voi 
ladata iframeen.

## Muutaman lauseen kuvaus tekemästäsi ratkaisusta
Tämä on ensimmäinen kosketukseni Flutteriin, eli ratkaisut ovat
enimmäkseen arvaamalla kehitettyjä ja suoraan oletus-sovelluksen koodia
muokkaamalla tehtyjä. Testaus on tapahtunut manuaalisesti, käyttöliitymää tökkien.

Ulkoasussa on toivomisen varaa, varsinkin auton valinta voisi näyttää paremmalta mutta
vaikuttaa siltä että kaikki widgetit eivät sovi yhteen.

Kaikki muokkaamani koodi löytyy tiedostosta `lib/main.dart`, muu on generoitua.