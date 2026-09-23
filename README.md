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

## Jak to použít

1. Stáhni `index.html` (můžeš si ho přejmenovat, jak chceš)
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

Oba jsou cizí servery s vlastními podmínkami použití. Pro občasné osobní použití
v pohodě; kdyby se z toho stal nástroj s tisíci uživateli, patří se přejít na placené
dlaždice s vlastním API klíčem.
