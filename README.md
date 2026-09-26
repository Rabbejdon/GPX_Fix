# GPX Fixer

Oprava GPS stop ze Stravy a podobných aplikací. Běží celá v prohlížeči — **tvoje GPX
se nikam neodesílá**, všechno se počítá u tebe v počítači.

## Co to opraví

**GPS skok** — signál na chvíli ulítne o desítky až stovky metrů a zase se vrátí.
Do stopy to přidá kilometry, které jsi neuběhl. Nástroj skok najde a narovná.

**Výpadek signálu** — GPS vypadne na delší dobu (les, tunel, mrak). Tady rovná čára
nestačí, protože vede přes svah místo po cestě, takže si trasu **doklikáš do mapy**
podle toho, kudy jsi skutečně šel.

**Aplikace spadla uprostřed aktivity** — nahraješ oba díly najednou a spojí se do jedné
stopy. Když jsi mezitím jen stál (fotil na vrcholu), rozpozná to a nechá tam pauzu.


## Dvě verze

**`index.html` — GPX Fixer.** Najde jednotlivé problémy a nabídne opravu. Na skok,
výpadek nebo spadlou aplikaci to stačí.

**`omni_fix.html` — GPX Omni Fix.** Totéž, plus **překreslení celé trasy**. To se hodí,
když stopa kmitá po celé délce — tempo skáče, i když jsi běžel stejně, a žádný
jednotlivý výkyv není dost velký na to, aby ho detektor chytil.

Obtáhneš trasu na mapě znovu a časy se převezmou z původních bodů: každý se promítne
na novou trasu, čímž se boční výkyvy samy srovnají zpět na cestu. Postup se pak vyhladí
(nastavitelné, výchozí 15 bodů), protože projekce sice srovná výkyvy do stran, ale šum
podél trasy zůstává.

Na reálném pětikilometru to znamenalo tohle:

| | před | po |
|---|---|---|
| Maximum | 18,6 m/s | 4,6 m/s |
| 99. percentil | 7,1 | 4,5 |
| Medián | 2,58 | 2,50 |

Medián se skoro nehne — vyhlazení tedy tempo nekřiví, jen ořezává nesmysly.
**Vzdálenost po překreslení odpovídá tomu, co nakreslíš**, takže klikej podle mapy pozorně.

## Jak to použít

1. Stáhni `index.html` nebo `omni_fix.html` (můžeš si je přejmenovat, jak chceš)
2. Otevři dvojklikem
3. Přetáhni do něj GPX — víc dílů naráz se spojí
4. Projdi nalezené problémy, u každého vyber co s ním
5. **Stáhnout opravený GPX**

Na Stravě pak nahraj opravený soubor a smaž tu původní aktivitu.

## Co je dobré vědět

- **Tepovka a kadence** se zachovají a u dopočítaných bodů se dointerpolují
- Zpracuje jen tracky — **waypointy a routy se ztratí**
- Potřebuje internet kvůli mapě (samotná oprava by šla i bez ní)
- Prahy citlivosti jsou dole v panelu — u klikatých tratí je možná budeš chtít povolit
- Originál ti zůstane nedotčený, stahuje se nový soubor

### Soukromí

GPX zůstává u tebe. Ale pozor na jednu věc: mapové dlaždice se tahají z cizích serverů,
takže **ten server vidí, na kterou část mapy se díváš** — tedy přibližně kudy jsi běhal.
Dělá to každá mapová aplikace včetně Stravy, ale je fér to vědět.

## Podklady

Mapy: [OpenTopoMap](https://opentopomap.org/) (CC-BY-SA, data © OpenStreetMap
přispěvatelé, SRTM) a Esri. Knihovna [Leaflet](https://leafletjs.com/) (BSD-2-Clause).
